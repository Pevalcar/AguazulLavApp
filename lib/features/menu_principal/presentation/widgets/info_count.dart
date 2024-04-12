import 'package:aguazullavapp/lib.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCount extends HookConsumerWidget {
  const InfoCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String usuario =
        ref.watch(userStateCurrentProvider).value?.displayName ?? "";
    final formater = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String hora = formater.format(DateTime.now());
    const String stadoServidor = "Espacio libre del servidor";
    final version = ref.watch(infoAppProvider);

    final connect = ref.watch(conectedBluetueProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _InfoText(
              title: 'Impresora Conectada: ',
              info: connect ? 'Si 🟢' : 'No 🔴'),
          _InfoText(title: 'Usuario: ', info: usuario),
          _InfoText(title: 'Fecha: ', info: hora),
          const _InfoText(title: 'Servidor: ', info: stadoServidor),
          _InfoText(title: 'Version: ', info: version.value.toString()),
        ],
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  final String title;
  final String info;

  const _InfoText({
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
