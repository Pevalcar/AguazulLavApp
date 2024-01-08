import 'package:flutter/material.dart';

class InfoCount extends StatelessWidget {
  const InfoCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      const String usuario = 'Pepa ping';
      final String hora = TimeOfDay(
        hour: DateTime.now().hour,
        minute: DateTime.now().minute,
      ).toString();
      const String stadoServidor = "Espacio libre del servidor"; 

      const String version = "0.1";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const _infoText(title: 'Usuario: ',info: usuario),
          _infoText(title: 'Hora: ',info: hora),
          const _infoText(title: 'Servidor: ',info: stadoServidor),
          const _infoText(title: 'Version: ',info: version),
          
        ],
      ),
    );
  }
}

class _infoText extends StatelessWidget {
 final String title;
 final String info;

  const _infoText({
    required this.info, required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style:  const TextStyle(fontWeight: FontWeight.bold)),
        Text(info),
      ],
    );
  }
}
