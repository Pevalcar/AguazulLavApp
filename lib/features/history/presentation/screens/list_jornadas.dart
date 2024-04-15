import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//deprecated porque no se usa en el historial
class ListJornadas extends HookConsumerWidget {
  const ListJornadas({
    super.key,
  });
//TODOdividir la lsita en fechas enero 2022 ejemplo
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadas = ref.watch(jornadasListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jornadas'),
        actions: const [DarkModeButton()],
      ),
      body: jornadas.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return HistorialJornadaCard(jornadad: data[index]);
                });
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
