import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Handled extends ConsumerWidget {
  const Handled({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(photoVehiculeProvider);
    final id = useState("");

    ref.listen(vehiculoStateProvider, (previous, next) {
      if (next.asData?.value. id != "" ) {

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
            child: photo?.contains("https://") ?? false
                ? LoadPhotoUrl(photo: photo ?? "")
                : Image.file(
                    File(photo ?? ""),
                    fit: BoxFit.cover,
                  )));
  }
}

class LoadPhotoUrl extends StatelessWidget {
  const LoadPhotoUrl({
    super.key,
    required this.photo,
  });

  final String photo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(),
        Image.network(
          photo.isEmpty ? "https://firebasestorage.googleapis.com/v0/b/aguazullavapp.appspot.com/o/prueba.png?alt=media&token=014c8681-7981-49cc-9f9a-0e9b1894c84c" : photo,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
