// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:aguazullavapp/ui/addService/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../model/models.dart';
import '../../providers/index.dart';

class AddServiceScreen extends HookConsumerWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(typeServicesListProvider);
    final loading = ref.watch(isLoadingProvider);
    print("se cargo la scrren");
    return WillPopScope(
      onWillPop: () {
        _completeFrom(ref.read(vehiculoStateProvider.notifier), context);
        return Future.value(false);
      },
      child: loading
          ? const Loading()
          : ref.watch(vehiculoStateProvider).when(
              loading: () => const Loading(),
              error: (error, stackTrace) => Scaffold(
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("error: ${error.toString()}."),
                  ],
                )),
              ),
              data: (Vehicle vehiculo) => Scaffold(
                appBar: AppBar(
                  title: const Text('Información del vehiculo'),
                  actions: [
                    IconButton(
                      onPressed: !vehiculo.terminado
                          ? null
                          : () {
                              //Todo Implementar impresión
                            },
                      icon: const Icon(Icons.print),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: vehiculo.onCreate
                              ? null
                              : () async {
                                  try {
                                    await ref
                                        .read(vehiculoStateProvider.notifier)
                                        .addService();
                                    _completeFrom(
                                        ref.read(
                                            vehiculoStateProvider.notifier),
                                        context);
                                  } on Exception catch (error) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(error.toString()),
                                    ));
                                  }
                                }),
                    )
                  ],
                ),
                body: ListView(
                  children: [
                    Text(
                      "Factura Numero: ${vehiculo.id}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Handled(id: vehiculo.id, photo: vehiculo.photo),
                    Formulario(vehiculo: vehiculo),
                    const TypedCardSelector(),
                    _TypeCardSelectable(
                      listServices: listServices,
                      serviceSelection: vehiculo.servicios,
                    ),
                    TimerDataShow(
                      initTime: vehiculo.entrada,
                      endTime: vehiculo.salida,
                    ),
                  ],
                ),
                floatingActionButton: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (kIsWeb) 
                    ? SizedBox(height: 10)
                    : (Platform.isAndroid && Platform.isIOS) 
                    ?FloatingActionButton(
                        onPressed: () {
                          _getFromCamera(
                              ref.read(vehiculoStateProvider.notifier));
                        },
                        child: const Icon(Icons.camera_alt),
                      )
                      : SizedBox(height: 10),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: () {
                        _getFromGallery(
                            ref.read(vehiculoStateProvider.notifier));
                      },
                      child: const Icon(Icons.photo_library_rounded),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  _completeFrom(VehiculoState ref, BuildContext context) async {
    ref.reset();
    Navigator.pop(context, false);
  }

//get camera
  _getFromCamera(VehiculoState ref) async {
    XFile? pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    ));
    if (pickedFile != null) {
      ref.addPhoto(pickedFile.path);
    }
  }

  /// Get from gallery
  _getFromGallery(VehiculoState ref) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      ref.addPhoto(image.path);
    }
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
            onChanged: (value) => ref
                .read(vehiculoStateProvider.notifier)
                .modifyPropietario(value),
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
            onChanged: (value) =>
                ref.read(vehiculoStateProvider.notifier).modifyPlaca(value),
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
