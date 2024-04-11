import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardCarService extends HookConsumerWidget {
  final Vehicle vehicle;
  final bool _editable;

  const CardCarService({
    super.key,
    required this.vehicle,
    bool editable = true,
  }) : _editable = editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(getUserInfoProvider(vehicle.propietarioid));
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
        key: UniqueKey(),
        controller: controller,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  cacheHeight: 80,
                  cacheWidth: 80,
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
            Text(formatearIntACantidad(vehicle.typePrice))
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        text: vehicle.typeService)
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
                      text: client.asData?.value?.name ?? "No definido",
                    )
                  ])),
            ])),
            vehicle.terminado
                ? const TerminadoBadge()
                : const SinTerminarBadge(),
          ],
        ),
        children: [
          Text(vehicle.tipoPago),
          /* TODO ════════ Exception caught by painting library ══════════════════════════════════
Image null has a display size of 501×921 but a decode size of 1002×1840, which uses an additional 7196KB (assuming a device pixel ratio of 1.75).

Consider resizing the asset ahead of time, supplying a cacheWidth parameter of 501, a cacheHeight parameter of 921, or using a ResizeImage.
════════════════════════════════════════════════════════════════════════════════*/
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Información"),
                    content: CargarImagenDesdeCache(imageUrl: vehicle.photo),
                  );
                },
              );
            },
            child: SizedBox(
                height: 150,
                child: CargarImagenDesdeCache(imageUrl: vehicle.photo)),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            buttonHeight: 52.0,
            buttonMinWidth: 90.0,
            children: <Widget>[
              Visibility(
                visible: _editable,
                child: TextButton(
                  style: myStileButton,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => PinAccesDialog(correctPass: () {
                        ref
                            .read(serviceListProvider.notifier)
                            .deleteService(vehicle);
                      }),
                    );
                  },
                  child: const Column(
                    children: <Widget>[
                      Icon(Icons.delete),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Text('Borrar'),
                    ],
                  ),
                ),
              ),
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
              Visibility(
                visible: (vehicle.terminado == false && _editable),
                child: TextButton(
                  style: myStileButton,
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlerPago(
                          vehicle: vehicle,
                        );
                      },
                    );
                    controller.collapse();
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AlerPago extends HookConsumerWidget {
  const AlerPago({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> list = ["Efectivo", "Transferencia"];
    ValueNotifier<String> pagoType = useState(list.first);
    return AlertDialog(
        actions: [
          TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          TextButton(
              child: const Text("Aceptar"),
              onPressed: () async {
                await ref
                    .read(serviceListProvider.notifier)
                    .endService(vehicle.copyWith(
                      tipoPago: pagoType.value,
                    ));
                Navigator.of(context).pop();
              })
        ],
        title: const Text("Información de pago"),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          DropdownButton<String>(
            value: pagoType.value,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              pagoType.value = value!;
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]));
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
