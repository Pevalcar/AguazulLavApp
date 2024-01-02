import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Handled extends HookConsumerWidget {
  const Handled({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(photoVehiculeProvider);
    final id = useState("");

    ref.listen(vehiculoStateProvider, (previous, next) {
      if (next.asData?.value.id != "" && next.asData?.value.id != null) {
        id.value = next.asData!.value.id;
        ref
            .read(photoVehiculeProvider.notifier)
            .modifyPhoto(next.asData!.value.photo);
      }
    });

    return SizedBox(
        height: 200,
        child: Hero(
          tag: id,
          child: GestureDetector(
            onTap: () => getFromCamera(context),
            onLongPress: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    Image.network(photo.asData?.value ?? ""),
                  ]),
                );
              },
            ),
            child: photo.when(
                data: (data) => Image.network(data ?? ""),
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => CircularProgressIndicator()),
          ),
        )
        // LoadPhotoUrl(photo: photo)
        );
  }

  getFromCamera(BuildContext context) async {
    XFile? pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 50,
    ));
    if (pickedFile != null) {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmImagePickerDialog(pickedFile: pickedFile);
          });
    }
  }

  /// Get from gallery
  getFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmImagePickerDialog(pickedFile: image);
          });
    }
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
        title: Text("¿Seguro que desea subir esta imagen?"),
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

class LoadPhotoUrl extends StatelessWidget {
  const LoadPhotoUrl({
    super.key,
    required this.photo,
  });

  final String? photo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(),
        Image.network(
          photo == null
              ? "https://firebasestorage.googleapis.com/v0/b/aguazullavapp.appspot.com/o/prueba.png?alt=media&token=014c8681-7981-49cc-9f9a-0e9b1894c84c"
              : photo!,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
