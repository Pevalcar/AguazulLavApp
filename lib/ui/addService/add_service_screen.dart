// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/models.dart';
import 'package:aguazullavapp/ui/addService/widgets/index.dart';
import '../../providers/index.dart';

class AddServiceScreen extends ConsumerWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(typeServicesListProvider);
    final state = ref.watch(vehiculoStateProvider);

    return WillPopScope(
      onWillPop: () {
        _completeFrom(ref.read(vehiculoStateProvider.notifier), context);
        return Future.value(false);
      },
      child: state.when(
        loading: () => const Scaffold(
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text("Guardando el Nuevo Servicio..."),
            ],
          )),
        ),
        error: (error, stackTrace) => Scaffold(
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("error: ${error.toString()}."),
            ],
          )),
        ),
        data: (vehiculo) => Scaffold(
          appBar: AppBar(
            title: const Text('Información del vehiculo'),
            actions: [
              IconButton(
                onPressed: vehiculo.terminado
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
                    onPressed: vehiculo.placa.isNotEmpty
                        ? null
                        : () async {
                            try {
                              await ref
                                  .read(vehiculoStateProvider.notifier)
                                  .addService();
                              _completeFrom(
                                  ref.read(vehiculoStateProvider.notifier),
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
              _Handled(id: vehiculo.id, photo: vehiculo.photo),
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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _getFromGallery(ref.read(vehiculoStateProvider.notifier));
            },
            child: const Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }

  _completeFrom(VehiculoState ref, context) {
    ref.reset();
    Navigator.pop(context, false);
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
//get camera

//_getFromCamera(Ref ref) async {
//  PickedFile pickedFile = (await ImagePicker().pickImage(
//    source: ImageSource.camera,
//    maxWidth: 1800,
//    maxHeight: 1800,
//  )) as PickedFile;
//
//  ref.read(vehiculoStateProvider.notifier).addPhoto(pickedFile.path);
//  }

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

class _Handled extends ConsumerWidget {
  final String id;
  final String photo;

  const _Handled({required this.id, required this.photo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rutas = ref.watch(getRutasProvider);
    rutas.toString();
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          // todo implementar un visor de fotos
          print("se clikeo ");
        },
        child: Hero(
          tag: id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              (photo.contains("https://") || photo.isEmpty)
                  ? FadeInImage.memoryNetwork(
                      image: photo.isEmpty
                          ? "https://picsum.photos/200/300"
                          : photo,
                      placeholder: kTransparentImage,
                      fit: BoxFit.cover)
                  : Image.file(
                      File(photo),
                      fit: BoxFit.cover,
                    )
            ],
          ),
        ),
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
            decoration: const InputDecoration(
              labelText: "Placa",
              icon: Icon(Icons.numbers_rounded),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo requerido';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
