import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

import 'list_jornadas.dart';

//TODO agregar pc soport
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: const [DarkModeButton()],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            ElevatedButton(
                onPressed: () {
                  ListJornadasRoute().push(context);
                },
                child: const Text('Lista de jornadas')),
          ],
        ),
      ),
    );
  }
}
