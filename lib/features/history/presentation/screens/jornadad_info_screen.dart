import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//TODO agregar informacino de pago si es efectivo o transferencia con foto
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
            data: (data) => CustomScrollView(
                    physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.normal),
                    slivers: [
                      SliverToBoxAdapter(
                          child: _JornadaInfoStats(data: data!.jornada)),
                      const SliverToBoxAdapter(child: Divider()),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).colorScheme.primaryContainer,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Informacion de la jornada".toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _ListaPorTrabajadores(data: data),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Entradas y salidas:',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith( fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SliverList.builder(
                          itemCount: data.entradaSalidasList.length,
                          itemBuilder: (context, index) {
                            return EntradaSalidaCard(
                                information: data.entradaSalidasList[index]);
                          })
                    ]),
            error: (error, stackTrace) => Text(error.toString()),
            //
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}

class TituloSliver extends StatelessWidget {
  const TituloSliver(
    this.title, {
    super.key,
    double toolBarHeight = 0.0,
    bool pinned = true,
    bool floating = true,
    Color? color,
  })  : _pinned = pinned,
        _floating = floating,
        _color = color,
        _toolBarHeight = toolBarHeight;

  final bool _pinned;
  final bool _floating;
  final Color? _color;
  final String title;
  final double _toolBarHeight;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: _pinned,
      floating: _floating,
      delegate: SliverTitleDelegate(
        toolBarHeight: _toolBarHeight,
        alturaAbierto: 30,
        alturaCerrado: 20,
        color: _color ?? Theme.of(context).colorScheme.secondary,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 5),
        ),
      ),
    );
  }
}

class _ListaPorTrabajadores extends StatelessWidget {
  const _ListaPorTrabajadores({
    required this.data,
  });
  final JornadaInfoModel data;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: data.listaOrdenada.length,
        itemBuilder: (context, index) {
          return SingleListTrabajador(servicios: data.listaOrdenada[index]);
        });
  }
}

class SingleListTrabajador extends StatelessWidget {
  const SingleListTrabajador({
    super.key,
    required List<Vehicle> servicios,
  }) : _servicios = servicios;
  final List<Vehicle> _servicios;
  String calculerTotal(List<Vehicle> servicios) {
    int total = 0;
    for (var element in servicios) {
      if (element.terminado) total += element.typePrice;
    }
    return formatearIntACantidad(total);
  }

  String serviciosConteo(list) {
    int terminados = 0;
    for (var element in list) {
      if (element.terminado) terminados++;
    }
    return 'Recibidos $terminados /  ${list.length}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondary.withOpacity(.30),
        ),
        child: Column(
          children: [
            Text(_servicios[0].trabjador,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            ..._servicios.map((e) => CardCarService(
                  vehicle: e,
                  editable: false,
                )),
            Text(
              serviciosConteo(_servicios),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Text(
              'Total  ${calculerTotal(_servicios)}',
            ),
          ],
        ),
      ),
    );
  }
}

// class ServicioTrabajadroCard extends StatelessWidget {
//   const ServicioTrabajadroCard({
//     super.key,
//     required Vehicle servicios,
//   }) : _servicios = servicios;

//   final Vehicle _servicios;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           Text(
//             _servicios.terminado.toString()
//           ),
//           Text(_servicios.trabjador),
//           Text(_servicios.entrada != null
//               ? DateFormat('dd/MM/yyyy-hh:mm').format(_servicios.entrada)
//               : "no finalizo"),
//         ],
//       ),
//     );
//   }
// }

class _JornadaInfoStats extends StatelessWidget {
  const _JornadaInfoStats({
    required Jornada data,
  }) : _data = data;

  final Jornada _data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _InformationList(data: _data),
    );
  }
}

class _InformationList extends StatelessWidget {
  const _InformationList({
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
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StadisticStringRow(
                title: 'Total Servicios del dia',
                valor: _data.procesos,
                good: null),
            StadisticRow(
                title: 'Caja Inicial', valor: _data.cajaInicial, good: null),
            StadisticRow(title: 'Salidas', valor: _data.salidas, good: false),
            StadisticRow(title: 'Entradas', valor: _data.entradas, good: true),
            StadisticRow(
              title: 'Ingresos',
              valor: _data.ingresos,
              good: true,
            ),
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
