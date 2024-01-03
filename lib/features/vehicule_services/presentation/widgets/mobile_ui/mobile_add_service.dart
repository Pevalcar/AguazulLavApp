import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../formulario.dart';
import '../type_card_selectable.dart';

class MobileAddService extends HookConsumerWidget {
  const MobileAddService({super.key});

  _submit(WidgetRef ref) {
    //TODO
    // ref.read(vehiculoStateProvider.notifier).();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(vehiculoStateProvider);
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
              Text(
                "Factura Numero: ${vehicle.asData!.value?.id}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Handled(),
              Formulario(),
              //TODO  renombrar la clase de la card esa y agregar que en otro se pueda colocar precio y descripccion
              TypedCardSelector(
                typesList: ref.watch(typosDeVeiculosProvider),
                type: typeService,
              ),
              typeService == "OTRO."
                  ? const OtroOptions()
                  : ServiceTypeSelecte(type: typeService),
              const TimerDataShow(),
            ]),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              (kIsWeb)
                  ? const SizedBox(height: 10)
                  : (Platform.isAndroid && Platform.isIOS)
                      ? FloatingActionButton(
                          onPressed: () {
                            // getFromCamera(
                            //     ref.read(vehiculoStateProvider.notifier));
                          },
                          child: const Icon(Icons.camera_alt),
                        )
                      : const SizedBox(height: 10),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  GoRouter.of(context).push('/addServiceType');
                },
                child: const Icon(Icons.photo_library_rounded),
              ),
            ],
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
    final _keyForm = GlobalKey<FormState>();
    return Form(
      key: _keyForm,
      child: const Text("Servicio"),
    );
  }
}
