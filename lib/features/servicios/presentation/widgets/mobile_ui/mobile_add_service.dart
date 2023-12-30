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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(vehiculoStateProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Información del vehiculo'),
          actions: [const AppBarAddService(mobile: false)],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Text(
              "Factura Numero: ${vehicle.id}",
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
              type: ref.watch(typoDeVehiculoProvider),
            ),
            TypeCardSelectable(),
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
                          getFromCamera(
                              ref.read(vehiculoStateProvider.notifier));
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
        ));
  }
}
