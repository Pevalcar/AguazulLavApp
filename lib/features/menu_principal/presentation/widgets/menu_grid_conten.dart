import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class MenuGridConten extends HookConsumerWidget {
  const MenuGridConten({
    super.key,
  });
//TODO Agregar funciones solo administrador

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadaState = ref.watch(jornadaStateProvider);

    const disableColorbtn = Color(0xFFD8E4EB);

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
            color: Theme.of(context).colorScheme.error,
            //TODO indicador de que la jornada no ha iniciado parpadeo o algo
            onPressed: () {
              const AddServiceRoute().push(context);
            }),
        ActionCardMenu(
            title: "Lista de Servicios",
            icon: Icons.list_alt,
            color: const Color.fromARGB(
                255, 49, 210, 216), //Color.fromARGB(255, 222, 8, 19),
            onPressed: () {
              const ListVehiculosRoute().push(context);
            }),
        ActionCardMenu(
            title: "Modificar Servicio",
            icon: Icons.edit,
            //color #8C1DAB
            color: const Color(0xFF006d97),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => PinAccesDialog(
                        correctPass: () =>
                            const AddServiceTypeRoute().push(context),
                      ));
            }),
        ActionCardMenu(
            title: "Historial",
            icon: Icons.history,
            color: const Color.fromRGBO(76, 194, 230, 1),
            onPressed: () {
              const HistoryScreenRoute().push(context);
            }),
        ActionCardMenu(
            title: "Clientes",
            icon: Icons.person_add_alt,
            color: const Color.fromARGB(255, 104, 212, 245),
            onPressed: () {
              const AdminClientScreen().push(context);
            }),
        ActionCardMenu(
            title: "Configurar Imprimir",
            icon: Icons.print,
            color: const Color.fromARGB(255, 104, 212, 245),
            onPressed: () {
              const ConfigPrintScreenRoute().push(context);
            }),
        // ActionCardMenu(
        //     title: "Administrar Cuentas",
        //     icon: Icons.people_outlined,
        //     color: disableColorbtn,
        //     onPressed: () {}),
        ActionCardMenu(
            title: "Configuracion",
            icon: Icons.settings,
            color: disableColorbtn,
            onPressed: () {
              const ConfigScreenRoute().push(context);
            }),
        // ActionCardMenu(
        //     title: "Correo",
        //     icon: Icons.mail,
        //     color: disableColorbtn,
        //     onPressed: () {}),
        // ActionCardMenu(
        //     title: "Salir",
        //     icon: Icons.logout,
        //     color: disableColorbtn,
        //     onPressed: () {}),
      ],
    );
  }
}
