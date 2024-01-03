import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardCarService extends HookConsumerWidget {
  final Vehicle vehicle;

  const CardCarService({
    super.key,
    required this.vehicle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = ExpansionTileController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        controller: _controller,
        collapsedShape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(
              10.0,
            )),
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(
              50.0,
            )),
        title: Row(
          children: [
            Icon(
              Icons.numbers,
            ),
            Text(
              "${vehicle.placa == "" ? "FXL000" : vehicle.placa}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        subtitle: Text("Entrada: ${vehicle.entrada}"),
        trailing: Text(" \$ ${vehicle.typeid}"),
        children: [
          ContentExpand(vehicle: vehicle),
        ],
      ),
    );
  }
}

class ContentExpand extends ConsumerWidget {
  final Vehicle vehicle;

  const ContentExpand({
    super.key,
    required this.vehicle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ButtonStyle myStileButton = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      buttonHeight: 52.0,
      buttonMinWidth: 90.0,
      children: <Widget>[
        TextButton(
          style: myStileButton,
          onPressed: () {
            context.go("/vehicle/${vehicle.id}");
            // ref.read(vehiculoStateProvider.notifier).modifierVehicle(vehicle);
            // cardKey.currentState?.collapse();
          },
          child: const Column(
            children: <Widget>[
              Icon(Icons.document_scanner_outlined),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
              ),
              Text('Información'),
            ],
          ),
        ),
        if (!vehicle.terminado)
          TextButton(
            style: myStileButton,
            onPressed: () {
              ref.read(serviceListProvider.notifier).endService(vehicle);
              // cardKey.currentState?.collapse();
            },
            child: const Column(
              children: <Widget>[
                Icon(Icons.task),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
                Text('Terminar'),
              ],
            ),
          ),
      ],
    );
  }
}
