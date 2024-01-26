import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

//TODO implementar la edicion solo para administradores
class Handled extends HookConsumerWidget {
  final bool isEdit;
  const Handled({
    super.key,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(photoVehiculeProvider);
    final id = useState("");

    ref.listen(vehiculoStateProvider, (previous, next) {
      if (isEdit) {
        id.value = next.asData!.value?.id ?? "";
        ref
            .read(photoVehiculeProvider.notifier)
            .modifyPhoto(next.asData!.value!.photo,next.asData!.value!.photoName,);
      }
    });
    ref.listen(photoVehiculeProvider, (previous, next) {
      if (previous?.asData?.value?.message != next.asData?.value?.message) {
        if (next.asData?.value?.message != "" &&
            next.asData?.value?.message != null) {
          showToast(context, next.asData?.value?.message ?? "");
        }
      }
    });

    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Hero(
            tag: id,
            child: photo.when(
              data: (data) {
                return data?.url == null || data?.url == ""
                    ? Assets.images.placeolder.image(
                        cacheHeight: 430,
                        cacheWidth: 300,
                        width: 300,
                        height: 430,
                      )
                    : PhotoView(url: data?.url ?? "");
              },
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => Skeletonizer(
                enabled: true,
                child: Assets.images.placeolder.image(),
              ),
            ),
            // LoadPhotoUrl(photo: photo)
          ),
        ),
        const SizedBox(height: 10),
        const Text("Selecciona una imagen"),
        const SizedBox(height: 10),

        //TODO implementar la edicion solo para administradores y solo en moviles las acciones
        photo.asData?.value?.url != null && !isEdit
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const SizedBox(width: 10),
                CloseButton(
                  onPressed: () => ref
                      .read(photoVehiculeProvider.notifier)
                      .deletePhoto(photo.asData?.value?.url,null),
                )
              ])
            : Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () => getFromCamera(
                        (photo) => _showImagePickerDialog(photo, context)),
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () => getFromGallery(
                        (photo) => _showImagePickerDialog(photo, context)),
                    child: const Icon(Icons.photo_library_rounded),
                  ),
                ),
                const SizedBox(width: 10),
              ])
      ],
    );
  }

  void _showImagePickerDialog(XFile image, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmImagePickerDialog(pickedFile: image);
      },
    );
  }

  void getFromCamera(Function(XFile) onImageSelected) async {
    XFile? pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 50,
    ));
    if (pickedFile != null) {
      onImageSelected(pickedFile);
    }
  }

  void getFromGallery(Function(XFile) onImageSelected) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 50,
    );
    if (image != null) {
      onImageSelected(image);
    }
  }
}

class PhotoView extends StatelessWidget {
  final String url;
  const PhotoView({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              CarcgasDesdeCache(imageUrl: url),
            ]),
          );
        },
      ),
      child: CarcgasDesdeCache(imageUrl: url),
    );
  }
}

class ConfirmImagePickerDialog extends HookConsumerWidget {
  const ConfirmImagePickerDialog({
    super.key,
    required this.pickedFile,
  });

  final XFile? pickedFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('pickedFile: ${pickedFile?.name}');
    return AlertDialog(
        title: const Text("¿Seguro que desea subir esta imagen?"),
        content: Image.file(
          File(pickedFile!.path),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(photoVehiculeProvider.notifier).uploadPhoto(pickedFile!);
            },
            child: const Text("Subir"),
          )
        ]);
  }
}
