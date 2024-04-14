import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';


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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //tipo de servico lavado enjeage etc
                  TextRich(
                    title: "Propietario: ",
                    text: client.asData?.value?.name ?? "No definido",
                  ),
                  //Propietario
                  TextRich(title: "Servicio: ", text: vehicle.typeService),
                  TextRich(
                    title: "Trabajador: ",
                    text: vehicle.trabjador,
                  ),
                ])),
            TerminadoBadge(vehicle.terminado)
          ],
        ),
        children: [
          vehicle.terminado
              ? Text("Tipo de pago: ${vehicle.tipoPago}")
              : const Text("Tipo de pago: "),
          Text("Trabjador: ${vehicle.trabjador}"),
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
            alignment: MainAxisAlignment.spaceBetween,
            buttonHeight: 52.0,
            buttonMinWidth: 90.0,
            children: <Widget>[
              PrintButton(client: client, vehicle: vehicle),
              MyActionButton(
                editable: _editable,
                icon: Icons.delete,
                text: 'Borrar',
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (context) => PinAccesDialog(correctPass: () {
                      ref
                          .read(serviceListProvider.notifier)
                          .deleteService(vehicle);
                    }),
                  )
                },
              ),
              MyActionButton(
                editable: true,
                icon: Icons.document_scanner,
                text: 'Informacion',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return _InfoCard(vehicle: vehicle, client: client);
                    },
                  );
                },
              ),
              MyActionButton(
                editable: _editable,
                terminado: !vehicle.terminado,
                icon: Icons.task,
                text: 'Terminar',
                onPressed: () {
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyActionButton extends HookConsumerWidget {
  const MyActionButton({
    super.key,
    required bool editable,
    required this.onPressed,
    required this.icon,
    required this.text,
    bool terminado = true,
  })  : _editable = editable,
        _terminado = terminado;

  final bool _editable;
  final bool _terminado;
  final Function()? onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ButtonStyle myStileButton = TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ));
    return Visibility(
      visible: _editable && _terminado,
      child: TextButton(
        style: myStileButton,
        onPressed: () => onPressed!(),
        child: Column(
          children: <Widget>[
            Icon(icon),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class TextRich extends StatelessWidget {
  const TextRich({
    super.key,
    required this.text,
    required this.title,
  });

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        overflow: TextOverflow.ellipsis,
        TextSpan(
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.bold),
            text: title,
            children: [
              TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                text: text,
              )
            ]));
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.vehicle,
    required this.client,
  });

  final Vehicle vehicle;
  final AsyncValue<Client?> client;

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat('dd/MM/yyyy-hh:mm');

    return Dialog.fullscreen(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BackButton(),
              const SizedBox(height: 30),
              Center(child: CargarImagenDesdeCache(imageUrl: vehicle.photo)),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Información",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRich(title: "Placa: ", text: vehicle.placa),
                  TextRich(
                      title: "Tipo de servicio: ", text: vehicle.typeService),
                  TextRich(title: "Trabajador: ", text: vehicle.trabjador),
                  TextRich(
                      title: "Estado: ",
                      text: vehicle.terminado ? "Terminado" : "Pendiente"),
                  TextRich(title: "Tipo de pago: ", text: vehicle.tipoPago),
                  TextRich(
                      title: "Precio: ",
                      text: formatearIntACantidad(vehicle.typePrice)),
                  TextRich(
                      title: "Cliente: ",
                      text: client.asData?.value?.name ?? "No definido"),
                  TextRich(
                      title: "Fecha Entrada: ",
                      text: formater.format(vehicle.entrada)),
                  TextRich(
                      title: "Fecha Salida: ",
                      text: vehicle.salida != null
                          ? formater.format(vehicle.salida ?? DateTime.now())
                          : "no finalizo"),
                ],
              ),
            ],
          ),
        ),
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
                // ignore: use_build_context_synchronously
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
  const TerminadoBadge(
    this.terminado, {
    super.key,
  });
  final bool terminado;
  @override
  Widget build(BuildContext context) {
    final color = terminado
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.errorContainer;
    return RoundedBadge(
      icon: Icon(Icons.check, color: color),
      title: terminado ? "Terminado" : "Pendiente",
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
