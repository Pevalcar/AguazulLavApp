import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarcgasDesdeCache extends StatelessWidget {
  final String imageUrl;
  const CarcgasDesdeCache({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      memCacheHeight: 410,
      memCacheWidth: 310,
      imageUrl: imageUrl.isEmpty ? 'https://firebasestorage.googleapis.com/v0/b/aguazullavapp.appspot.com/o/prueba.png?alt=media&token=014c8681-7981-49cc-9f9a-0e9b1894c84c' : imageUrl,
      // imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: imageProvider,
      //         fit: BoxFit.cover,
      //         colorFilter: ColorFilter.mode(
      //             Colors.red, BlendMode.colorBurn)),
      // ),
      // ),
      placeholder: (context, url) => Skeletonizer(child: Container(width: 200, height: 200, color: Colors.grey.shade300)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
