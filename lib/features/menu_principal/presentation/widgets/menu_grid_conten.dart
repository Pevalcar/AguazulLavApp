import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upgrader/upgrader.dart';

class MenuGridConten extends HookConsumerWidget {
  const MenuGridConten({
    super.key,
  });
//TODO Agregar funciones solo administrador

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadaState = ref.watch(jornadaStateProvider);
    final upgrader = ref.watch(upgraderProvider);

    final disableColorbtn = const Color.fromARGB(255, 106, 136, 233)!;
    return upgrader.asData?.value != null
        ? UpgradeAlert(
            onUpdate: () {
              const UpgraderRoute().push(context);
              return true;
            },
            onLater: () {
              showToast(context, "Se actualizara despues");
              return false;
            },
            upgrader: upgrader.asData?.value,
            child: GridView(
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
                    color: const Color.fromARGB(255, 49, 210, 216)!,
                    //TODO indicador de que la jornada no ha iniciado parpadeo o algo
                    onPressed: () {
                      const AddServiceRoute().push(context);
                    }),
                ActionCardMenu(
                    title: "Modificar Servicio",
                    icon: Icons.edit,
                    //color #8C1DAB
                    color: const Color.fromARGB(255, 217, 140, 248)!,
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
                    color: Theme.of(context).colorScheme.primaryContainer,
                    onPressed: () {
                      const ListVehiculosRoute().push(context);
                    }),
                ActionCardMenu(
                    title: "Historial",
                    icon: Icons.history,
                    color: const Color.fromARGB(255, 76, 194, 230),
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
                    title: "Administrar Cuentas",
                    icon: Icons.people_outlined,
                    color: disableColorbtn,
                    onPressed: () {}),
                ActionCardMenu(
                    title: "Configuracion",
                    icon: Icons.settings,
                    color: disableColorbtn,
                    onPressed: () {}),
                ActionCardMenu(
                    title: "Imprimir Factura",
                    icon: Icons.print,
                    color: disableColorbtn,
                    onPressed: () {}),
                ActionCardMenu(
                    title: "Correo",
                    icon: Icons.mail,
                    color: disableColorbtn,
                    onPressed: () {}),
                ActionCardMenu(
                    title: "Salir",
                    icon: Icons.logout,
                    color: disableColorbtn,
                    onPressed: () {}),
              ],
            ),
          )
        : const SizedBox();
  }
}
