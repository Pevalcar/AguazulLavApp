import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class Handled extends ConsumerWidget {
  final String id;
  final String photo;

  const Handled({super.key, required this.id, required this.photo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          // todo implementar un visor de fotos
          print("se clikeo ");
        },
        child: Hero(
            tag: id,
            child: photo.contains("https://") || photo.isEmpty
                ? LoadPhotoUrl(photo: photo)
                : Image.file(
                    File(photo),
                  )),
      ),
    );
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
        FadeInImage.memoryNetwork(
            image: photo.isEmpty ? "https://picsum.photos/200/300" : photo,
            placeholder: kTransparentImage,
            fit: BoxFit.cover)
      ],
    );
  }
}
