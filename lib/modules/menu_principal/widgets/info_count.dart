import 'package:flutter/material.dart';

class InfoCount extends StatelessWidget {
  const InfoCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final String usuario = 'Pepa ping';
      final String hora = TimeOfDay(
        hour: DateTime.now().hour,
        minute: DateTime.now().minute,
      ).toString();
      final String stadoServidor = "Espacio libre del servidor"; 

      final String version = "0.1";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _infoText(title: 'Usuario: ',info: usuario),
          _infoText(title: 'Hora: ',info: hora),
          _infoText(title: 'Servidor: ',info: stadoServidor),
          _infoText(title: 'Version: ',info: version),
          
        ],
      ),
    );
  }
}

class _infoText extends StatelessWidget {
 final String title;
 final String info;

  _infoText({
    super.key,
    required this.info, required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style:  TextStyle(fontWeight: FontWeight.bold)),
        Text('$info'),
      ],
    );
  }
}
