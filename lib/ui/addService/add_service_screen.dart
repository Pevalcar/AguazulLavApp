import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/car/vehiculo_model.dart';
import '../../providers/index.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  File? imageFile;
  final bool platformMovil = (Platform.isIOS || Platform.isAndroid);

  @override
  Widget build(BuildContext context) {
    Vehicle vehicular = ModalRoute.of(context)?.settings.arguments as Vehicle;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo servicio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ID : ${vehicular.id}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          _Handled(
            vehiculo: vehicular,
            photo: imageFile,
          ),
          Formulario(
            vehiculo: vehicular,
          ),
          DropdownButton(
              value: vehicular.type,
              items: VeiculoType.values
                  .toList()
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (value) {})
        ],
      ),
      floatingActionButton: (platformMovil)
          ? FloatingActionButton(
              onPressed: () {
                _getFromCamera();
              },
              child: const Icon(Icons.camera_alt),
            )
          : FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(vehicular.photo)));
                vehicular = vehicular.copyWith(photo: "imageFile?.path");
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(vehicular.photo)));
              },
              child: const Icon(Icons.add),
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
  //get cameta
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
  }
}

class _Handled extends ConsumerWidget {
  final Vehicle? vehiculo;
  final File? photo;

  const _Handled({required this.vehiculo, this.photo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rutas = ref.watch(getRutasProvider);
    rutas.toString();
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Hero(
          tag: vehiculo!.id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              (photo == null)
                  ? FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: (vehiculo!.photo.isEmpty)
                          ? 'https://picsum.photos/200/300'
                          : vehiculo!.photo,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.file(
                      photo!,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  final Vehicle vehiculo;

  Formulario({super.key, required this.vehiculo});

  final _keyFrom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyFrom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            initialValue: vehiculo.propietario.name,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    // todo implementar elm agregar usuario y retornar el usuario
                  },
                  icon: const Icon(
                    Icons.person_search,
                  )),
              labelText: "Propietario",
              icon: const Icon(Icons.person),
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
