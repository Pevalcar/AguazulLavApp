import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO interfaz de pc, agregar eliminar y modificar servicio, modificar la card de lista para ver mas informacion, agregar cuentas para ver ganancias, agregar caja menor y gastos
class MobileAddService extends HookConsumerWidget {
  const MobileAddService({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeService = ref.watch(typoDeVehiculoProvider);
//on back pressed delete photo
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {        
        ref.read(photoVehiculeProvider.notifier).deletePhoto( () => context.pop());
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
              typeService == "OTRO."
                  ? const OtroOptions()
                  : ServiceTypeSelecte(type: typeService),
              const TimerDataShow(),
              const SizedBox(height: 16),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push('/addServiceType');
            },
            child: const Icon(Icons.photo_library_rounded),
          )),
    );
  }
}

class OtroOptions extends StatelessWidget {
  const OtroOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    return Form(
      key: keyForm,
      child: const Text("Servicio"),
    );
  }
}
