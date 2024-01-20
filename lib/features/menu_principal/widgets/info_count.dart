import 'package:aguazullavapp/lib.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoCount extends HookConsumerWidget {
  const InfoCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String usuario = 'Pepa ping';
    final String hora = TimeOfDay(
      hour: DateTime.now().hour,
      minute: DateTime.now().minute,
    ).toString();
    const String stadoServidor = "Espacio libre del servidor";
    final version = ref.watch(infoAppProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const _infoText(title: 'Usuario: ', info: usuario),
          _infoText(title: 'Hora: ', info: hora),
          const _infoText(title: 'Servidor: ', info: stadoServidor),
          _infoText(title: 'Version: ', info: version.value.toString()),
        ],
      ),
    );
  }
}

class _infoText extends StatelessWidget {
  final String title;
  final String info;

  const _infoText({
    required this.info,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(info),
      ],
    );
  }
}
