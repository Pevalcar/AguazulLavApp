import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

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
      body: ListJornadas(),
    );
  }
}

class ListJornadas extends HookConsumerWidget {
  const ListJornadas({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadas = ref.watch(jornadasListProvider);
    return jornadas.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return JornadaCard(jornadad: data[index]);
              });
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator());
  }
}

class JornadaCard extends StatelessWidget {
  const JornadaCard({
    super.key,
    required Jornada jornadad,
  }) : _jornadad = jornadad;
  final Jornada _jornadad;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          JornadaInfoRoute( $extra:  _jornadad).push(context);
        },
        child: Column(
          children: [
            Text(_jornadad.total.toString()),
            Text(_jornadad.enJornada.toString()),
          ],
        ),
      ),
    );
  }
}


