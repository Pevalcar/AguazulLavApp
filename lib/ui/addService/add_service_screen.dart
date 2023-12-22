import 'dart:io';

import 'package:aguazullavapp/lib.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/app_bar_add_service.dart';

class AddServiceScreen extends HookConsumerWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loading = ref.watch(isLoadingProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Información del vehiculo'),
        actions: [AppBarAddService()],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const MobileAddService();
          }
          return const DesktopAddService();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          (kIsWeb)
              ? const SizedBox(height: 10)
              : (Platform.isAndroid && Platform.isIOS)
                  ? FloatingActionButton(
                      onPressed: () {
                        _getFromCamera(
                            ref.read(vehiculoStateProvider.notifier));
                      },
                      child: const Icon(Icons.camera_alt),
                    )
                  : const SizedBox(height: 10),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              _getFromGallery(ref.read(vehiculoStateProvider.notifier));
            },
            child: const Icon(Icons.photo_library_rounded),
          ),
        ],
      ),
    );
  }

//get camera
  _getFromCamera(VehiculoState ref) async {
    XFile? pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    ));
    if (pickedFile != null) {
      // ref.addPhoto(pickedFile.path);
    }
  }

  /// Get from gallery
  _getFromGallery(VehiculoState ref) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // ref.addPhoto(image.path);
    }
  }
}

class DesktopAddService extends HookConsumerWidget {
  const DesktopAddService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold();
  }
}

class MobileAddService extends HookConsumerWidget {
  const MobileAddService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(typeServicesListProvider);
    final vehicle = ref.watch(vehiculoStateProvider);
    return ListView(
      children: [
        Text(
          "Factura Numero: ${vehicle.value!.id}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Handled(id: vehicle.value!.id, photo: vehicle.value!.photo),
        Formulario(vehiculo: vehicle.value!),
        const TypedCardSelector(),
        _TypeCardSelectable(
          listServices: listServices,
          serviceSelection: vehicle.value!.servicios,
        ),
        TimerDataShow(
          initTime: vehicle.value!.entrada,
          endTime: vehicle.value!.salida,
        ),
      ],
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Guardando el Nuevo Servicio..."),
          ],
        ),
      ),
    );
  }
}

class _TypeCardSelectable extends StatelessWidget {
  const _TypeCardSelectable({
    required this.listServices,
    required this.serviceSelection,
  });

  final List<ServiceInfo> listServices;
  final ServiceInfo? serviceSelection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listServices
                .map((e) => TypeCardService(
                      typeCardService: e,
                      value:
                          (serviceSelection != null && serviceSelection == e),
                    ))
                .toList()),
      ),
    );
  }
}

class Formulario extends ConsumerWidget {
  final Vehicle vehiculo;

  Formulario({super.key, required this.vehiculo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _keyFrom = ref.watch(keyFromAddServiceProvider);
    return Form(
      key: _keyFrom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            initialValue: vehiculo.propietario.name,
            onChanged: (value)  {
              // ref
              //   .read(vehiculoStateProvider.notifier)
              //   .modifyPropietario(value) ;
                } ,
            decoration: const InputDecoration(
              suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.person_search,
                  )),
              labelText: "Propietario",
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo requerido';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: vehiculo.placa,
            onChanged: (value) {
                // ref.read(vehiculoStateProvider.notifier).modifyPlaca(value);
                },
            decoration: const InputDecoration(
              labelText: "Placa",
              icon: Icon(Icons.numbers_rounded),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo requerido';
              }
              if (value.length < 6) {
                return 'Placa invalida';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
