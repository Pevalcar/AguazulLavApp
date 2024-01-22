import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JornadaInfoScreen extends HookConsumerWidget {
  final Jornada? jornada;
  const JornadaInfoScreen({super.key, required this.jornada});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadas = ref.watch(jornadaInfoProvider(jornada));
    final dateFormat = DateFormat('dd/MM/yyyy');
    final time = dateFormat.format(jornada?.dateInit ?? DateTime.now());
    return Scaffold(
        appBar: AppBar(
          title: Text('Jornada $time'),
          actions: const [DarkModeButton()],
        ),
        body: jornadas.when(
            data: (data) => _JornadaInfoStats(data: data!.jornada),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}

class _JornadaInfoStats extends StatelessWidget {
  const _JornadaInfoStats({
    super.key,
    required Jornada data,
  }) : _data = data;

  final Jornada _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          _informationList(data: _data),
        ],
      ),
    ));
  }
}

class _informationList extends StatelessWidget {
  const _informationList({
    super.key,
    required Jornada data,
  }) : _data = data;

  final Jornada _data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
        ),
        child: Column(
          children: [
            StadisticStringRow(title: 'Total Servicios del dia', valor: _data.procesos, good: null),
            StadisticRow(
                title: 'Caja Inicial', valor: _data.cajaInicial, good: null),
            StadisticRow(
              title: 'Ingresos',
              valor: _data.ingresos,
              good: true,
            ),
            StadisticRow(title: 'Salidas', valor: _data.salidas, good: false),
            StadisticRow(
                title: 'Total',
                valor: _data.total,
                good: (_data.total) >= 0 ? true : false),
          ],
        ),
      ),
    );
  }
}
