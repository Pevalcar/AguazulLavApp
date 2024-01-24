import 'package:aguazullavapp/features/history/presentation/screens/history_screen.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
                  return JornadaCard(jornadad: data[index]);
                });
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}

//TODO modificar la apariencia de la tarjeta
class JornadaCard extends StatelessWidget {
  const JornadaCard({
    super.key,
    required Jornada jornadad,
  }) : _jornadad = jornadad;
  final Jornada _jornadad;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final time = dateFormat.format(_jornadad.dateInit ?? DateTime.now());
    return Card(
      color: Colors.blueGrey[100],
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



