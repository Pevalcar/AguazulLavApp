import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Handled extends ConsumerWidget {

  const Handled({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(vehiculoStateProvider);
    return vehicle.when(
        data: (data) {
          return SizedBox(
              height: 200,
              child: Hero(
                  tag: data.id,
                  child: data.photo.contains("https://") || data.photo.isEmpty
                      ? LoadPhotoUrl(photo: data.photo)
                      : Image.file(
                          File(data.photo),
                          fit: BoxFit.cover,
                        )));
        },
        error: (error, stackTrace) {
          debugPrint('error: ${error}');
          return const Icon(Icons.error);
        },
        loading: () => const CircularProgressIndicator());
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
          photo.isEmpty ? "https://picsum.photos/200/300" : photo,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
