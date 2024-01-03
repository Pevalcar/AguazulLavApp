import 'package:aguazullavapp/lib.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/carcgas_desde_cache.dart';

class CardCarService extends HookConsumerWidget {
  final Vehicle vehicle;

  const CardCarService({
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

    final controller = ExpansionTileController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        controller: controller,
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
              40.0,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.placa.image(
                  height: 30,
                  width: 30,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(width: 10),
                Text(
                  vehicle.placa == "" ? "FXL000" : vehicle.placa,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Text(" \$ ${vehicle.typeid == "" ? "25.000.00" : vehicle.typeid}")
          ],
        ),
        subtitle: Row(
          children: [
            Flexible(
                child: Column(children: [
              //tipo de servico lavado enjeage etc
              Text.rich(
                TextSpan(
                  text: "Servicio: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        style: Theme.of(context).textTheme.bodySmall,
                        text: vehicle.typeid)
                  ],
                ),
              ),
              //Propietario
              Text.rich(TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  text: "Propietario: ",
                  children: [
                    TextSpan(
                      style: Theme.of(context).textTheme.bodySmall,
                      text: vehicle.propietarioid == ""
                          ? "Sin propietario"
                          : vehicle.propietarioid ?? "Sin propietario",
                    )
                  ])),
            ])),
            vehicle.terminado
                ? const TerminadoBadge()
                : const SinTerminarBadge(),
          ],
        ),
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Información"),
                    content: CarcgasDesdeCache(imageUrl: vehicle.photo),
                  );
                },
              );
            },
            child: Container(
                height: 150, child: CarcgasDesdeCache(imageUrl: vehicle.photo)),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            buttonHeight: 52.0,
            buttonMinWidth: 90.0,
            children: <Widget>[
              TextButton(
                style: myStileButton,
                onPressed: () {},
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
              if (vehicle.terminado == false)
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
          )
        ],
      ),
    );
  }
}

class TerminadoBadge extends StatelessWidget {
  const TerminadoBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBadge(
      icon: Icon(Icons.check, color: Theme.of(context).colorScheme.secondary),
      title: "Terminado",
    );
  }
}

class SinTerminarBadge extends StatelessWidget {
  const SinTerminarBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBadge(
      icon: Icon(Icons.cancel,
          color: Theme.of(context).colorScheme.errorContainer),
      title: "Terminado",
    );
  }
}

class RoundedBadge extends StatelessWidget {
  final String title;
  final Widget icon;
  const RoundedBadge({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .onSecondaryContainer
              .withOpacity(.1),
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(.5),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.outline, fontSize: 9),
          ),
          icon,
        ],
      ),
    );
  }
}
