import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO interfaz de pc, agregar eliminar y modificar servicio, modificar la card de lista para ver mas informacion
class MobileAddService extends HookConsumerWidget {
  const MobileAddService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeService = ref.watch(typoDeVehiculoProvider);

//on back pressed delete photo
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        ref.read(photoVehiculeProvider.notifier).deletePhoto(
            ref.watch(photoVehiculeProvider).asData?.value?.photoName,
            () => context.pop());
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Información del vehiculo'),
            actions: [DarkModeButton()],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const Handled(),
              const Formulario(),
              DropDownTypeVehicle(
                typesList: ref.watch(typosDeVeiculosProvider),
                type: typeService,
              ),
              ServiceTypeSelecte(type: typeService),
              const TimerDataShow(),
              const SizedBox(height: 16),
            ]),
          ),
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              onPressed: () {
                final vehiculo = ref.watch(vehiculoStateProvider);
                ref.read(vehiculoStateProvider.notifier).addVehiculo(
                  () {
                    showToast(context, "Agreagado con Exito");
                    context.pop();
                  },
                  (errorMesage) {
                    showToast(context, errorMesage);
                  },
                );
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  Icon(Icons.room_service_sharp),
                ],
              ),
            ),
          ])),
    );
  }
}
