import 'package:aguazullavapp/ui/addService/widgets/time_data_show.dart';
import 'package:aguazullavapp/ui/addService/widgets/type_card.dart';
import 'package:aguazullavapp/ui/addService/widgets/type_class_selecter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/models.dart';
import '../../providers/index.dart';

class AddServiceScreen extends ConsumerWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(listServiceProvider);
    final vehicular = ref.watch(vehiculoProvider);
    final serviceSelection = ref.watch(serviceSelectProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo servicio'),
      ),
      body: ListView(
        children: [
          Text(
            "ID : ${vehicular.id}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          _Handled(id: vehicular.id, photo: vehicular.photo),
          Formulario(vehiculo: vehicular),
          TyperCardSelecter(),
          _TypeCardSeleteable(
            listServices: listServices,
            serviceSelection: serviceSelection,
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
          ref.read(vehiculoProvider.notifier).ModifierVeichle(
              vehicular.copyWith(photo: "https://picsum.photos/200/300"));
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

class _TypeCardSeleteable extends StatelessWidget {
  const _TypeCardSeleteable({
    super.key,
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
