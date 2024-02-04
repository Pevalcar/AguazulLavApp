import 'package:aguazullavapp/lib.dart';
import 'package:aguazullavapp/services/firestore_service/domain/providers/pinpass/pinpas_provider.dart';
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
            actions: const [AppBarAddService(mobile: false)],
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
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[ FloatingActionButton(
              onPressed: () {
                      },
              child: PinAccess(
                correctPin: ref.watch(pinPassProvider).asData?.value ?? 0,
                correctPass: () => GoRouter.of(context).push('/addServiceType'),
                child: const Row(
                  children: [
                    
                    Icon(Icons.add),
                    Icon(Icons.room_service_sharp),
                  ],
                ),
              ),
            ),]
          )
          ),
    );
  }
}
