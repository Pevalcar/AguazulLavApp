import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarcgasDesdeCache extends StatelessWidget {
  final String imageUrl;
  const CarcgasDesdeCache({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl == null || imageUrl.isEmpty ? 'https://firebasestorage.googleapis.com/v0/b/aguazullavapp.appspot.com/o/prueba.png?alt=media&token=014c8681-7981-49cc-9f9a-0e9b1894c84c' : imageUrl,
      // imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: imageProvider,
      //         fit: BoxFit.cover,
      //         colorFilter: ColorFilter.mode(
      //             Colors.red, BlendMode.colorBurn)),
      // ),
      // ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
