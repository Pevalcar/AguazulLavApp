import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aguazullavapp/providers/index.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../constants/rute/rutes.dart';
import '../../../model/car/vehiculo_model.dart';

class CardCarService extends StatefulWidget {
  final Vehicle vehicle;

  const CardCarService({
    super.key,
    required this.vehicle,
  });

  @override
  State<CardCarService> createState() => _CardCarServiceState();
}

class _CardCarServiceState extends State<CardCarService> {
  final GlobalKey<ExpansionTileCardState> _cardKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ExpansionTileCard(
        key: _cardKey,
        shadowColor: (widget.vehicle.terminado) ? Colors.green : Colors.red,
        elevation: 7,
        initialElevation: 5,
        expandedTextColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          "Propietario: ${widget.vehicle.propietario.name}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        leading: Hero(
          tag: widget.vehicle.id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              FadeInImage.memoryNetwork(
                  image: widget.vehicle.photo,
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover),
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Vehiculo: ${widget.vehicle.type}"),
                Text("Servicio: ${widget.vehicle.servicios!.nameService}"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Entrada: ${widget.vehicle.entrada}"),
                Text("Salida: ${widget.vehicle.salida}"),
              ],
            ),
          ],
        ),
        trailing: Text(" \$ ${widget.vehicle.price}"),
        children: [
          ContentExpand(cardKey: _cardKey, vehicle: widget.vehicle),
        ],
      ),
    );
  }
}

class ContentExpand extends ConsumerWidget {
  final GlobalKey<ExpansionTileCardState> cardKey;
  final Vehicle vehicle;

  const ContentExpand({
    super.key,
    required this.cardKey,
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
            Navigator.pushNamed(context, const Rutas.AddService().route);
            ref.read(vehiculoStateProvider.notifier).ModifierVeichle(vehicle);
            cardKey.currentState?.collapse();
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
              // todo implementar
              cardKey.currentState?.collapse();
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
