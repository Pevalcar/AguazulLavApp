import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aguazullavapp/providers/index.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

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
          child: widget.vehicle.photo.contains("https://")
              ? LoadPhotoUrl(widget: widget)
              : LoadPhotoFile(widget: widget),
        ),
        subtitle: ClipRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Vehiculo: ${widget.vehicle.type.name}"),
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
        ),
        trailing: Text(" \$ ${widget.vehicle.price}"),
        children: [
          ContentExpand(cardKey: _cardKey, vehicle: widget.vehicle),
        ],
      ),
    );
  }
}

class LoadPhotoUrl extends StatelessWidget {
  const LoadPhotoUrl({
    super.key,
    required this.widget,
  });

  final CardCarService widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(), FadeInImage.memoryNetwork(
                height: 50,
                width: 50,
                image: widget.vehicle.photo,
                placeholder: kTransparentImage,
                fit: BoxFit.scaleDown)
    
    ] ); 
  }
}

class LoadPhotoFile extends StatelessWidget {
  const LoadPhotoFile({
    super.key,
    required this.widget,
  });

  final CardCarService widget;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(widget.vehicle.photo),
      fit: BoxFit.scaleDown,
      height: 50,
      width: 50,
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
            context.go("/vehicle/${vehicle.id}");
            ref.read(vehiculoStateProvider.notifier).modifierVehicle(vehicle);
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
              ref.read(serviceListProvider.notifier).endService(vehicle);
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
