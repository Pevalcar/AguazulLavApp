import 'package:aguazullavapp/lib.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class MenuGridConten extends HookConsumerWidget {
  const MenuGridConten({
    super.key,
  });
//TODO Agregar funciones solo administrador
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadaState = ref.watch(jornadaStateProvider);
    return GridView(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      children: [
        ActionCardMenu(
            disabled: jornadaState.asData?.value?.enJornada == false,
            title: "Agregar Servicio",
            icon: Icons.add,
            color: Theme.of(context).colorScheme.primary,
            //TODO indicador de que la jornada no ha iniciado parpadeo o algo
            onPressed: () {
              const AddServiceRoute().push(context);
            }),
        ActionCardMenu(
            title: "Modificar Servicio",
            icon: Icons.edit,
            color: Colors.yellowAccent,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => PinAccesDialog(
                        correctPass: () =>
                            const AddServiceTypeRoute().push(context),
                      ));
            }),
        ActionCardMenu(
            title: "Lista de Servicios",
            icon: Icons.list_alt,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              const ListVehiculosRoute().push(context);
            }),
        ActionCardMenu(
            title: "Historial",
            icon: Icons.history,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              const HistoryScreenRoute().push(context);
            }),
        ActionCardMenu(
            title: "Clientes",
            icon: Icons.person_add_alt,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              const AdminClientScreen().push(context);
            }),
        ActionCardMenu(
            title: "Administrar Cuentas",
            icon: Icons.people_outlined,
            color: Colors.redAccent,
            onPressed: () {}),
        ActionCardMenu(
            title: "Configuracion",
            icon: Icons.settings,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Imprimir Factura",
            icon: Icons.print,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Correo",
            icon: Icons.mail,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Salir",
            icon: Icons.logout,
            color: Colors.red,
            onPressed: () {}),
      ],
    );
  }
}
