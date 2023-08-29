import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/models.dart';
import 'package:aguazullavapp/ui/addService/widgets/index.dart';
import '../../providers/index.dart';

class AddServiceScreen extends ConsumerWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(typeServicesListProvider);
    final vehicular = ref.watch(vehiculoStateProvider);
    final error = ref.watch(errorStateProvider);

    return WillPopScope(
      onWillPop: () {
        ref.read(vehiculoStateProvider.notifier).reset();
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Información del vehiculo'),
          actions: [
            IconButton(
              onPressed: !vehicular.terminado
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
                  onPressed: vehicular.placa.isNotEmpty
                      ? null
                      : () {
                          ref.read(vehiculoStateProvider.notifier).addService();
                          if (error.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(error),
                            ));
                            ref.read(errorStateProvider.notifier).reset();
                          }
                        }),
            )
          ],
        ),
        body: ListView(
          children: [
            Text(
              "Factura Numero: ${vehicular.id}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _Handled(id: vehicular.id, photo: vehicular.photo),
            Formulario(vehiculo: vehicular),
            const TypedCardSelector(),
            _TypeCardSelectable(
              listServices: listServices,
              serviceSelection: vehicular.servicios,
            ),
            TimerDataShow(
              initTime: vehicular.entrada,
              endTime: vehicular.salida,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(vehicular.photo)));
            ref.read(vehiculoStateProvider.notifier).ModifierVeichle(
                vehicular.copyWith(photo: "https://picsum.photos/200/300"));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(vehicular.photo)));
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  /// Get from gallery
  // _getFromGallery() async {
  //   PickedFile pickedFile = (await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   )) as PickedFile;
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
  /*get cameta
 
  _getFromCamera() async {
    PickedFile pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    )) as PickedFile;
    setState(() {
      imageFile = File(pickedFile.path);
      //veiculo = veiculo.copyWith(photo: pickedFile.path);
    });
  }*/
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
              (photo == "")
                  ? FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: (photo == "")
                          ? 'https://picsum.photos/200/300'
                          : photo,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.network(
                      photo,
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
