import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/car/vehiculo_model.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  File? imageFile;
  final bool platformMovile = (Platform.isIOS || Platform.isAndroid);
  String _currentType = VeiculoType.Bus.name;

  @override
  Widget build(BuildContext context) {
    Vehiculo veiculo = ModalRoute.of(context)?.settings.arguments as Vehiculo;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo servicio'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ID : ${veiculo.id}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          _Handled(
            veiculo: veiculo,
            photo: imageFile,
          ),
          Fromulario(
            veiculo: veiculo,
          ),
          DropdownButton(
              value: veiculo.type,
              items: VeiculoType.values
                  .toList()
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  veiculo = veiculo.copyWith(type: value!);
                });
              })
        ],
      ),
      floatingActionButton: (platformMovile)
          ? FloatingActionButton(
              onPressed: () {
                _getFromCamera();
              },
              child: const Icon(Icons.camera_alt),
            )
          : FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(veiculo.photo)));
                veiculo = veiculo.copyWith(photo: "imageFile?.path");
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(veiculo.photo)));
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

class _Handled extends StatelessWidget {
  final Vehiculo? veiculo;
  final File? photo;

  const _Handled({required this.veiculo, this.photo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Hero(
          tag: veiculo!.id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              (photo == null)
                  ? FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: (veiculo!.photo.isEmpty)
                          ? 'https://picsum.photos/200/300'
                          : veiculo!.photo,
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

class Fromulario extends StatelessWidget {
  final Vehiculo veiculo;

  Fromulario({super.key, required this.veiculo});

  final _keyFrom = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyFrom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            initialValue: veiculo.propietario.name,
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
            initialValue: veiculo.placa,
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
