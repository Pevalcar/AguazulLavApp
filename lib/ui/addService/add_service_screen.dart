import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../model/car/car_model.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final Veiculo veiculo = Veiculo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo servicio'),
      ),
      body: Column(
        children: [
         _Handled(veiculo: veiculo,)

        ],
      ),
    );
  }
}
class _Handled extends StatelessWidget {
  final Veiculo ? veiculo;
   const _Handled({required this.veiculo});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Hero(
          tag: veiculo!.id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: (veiculo!.photo.isEmpty) ? 'https://picsum.photos/200/300' : veiculo!.photo,
                fit: BoxFit.fitWidth,
              ),
              const Icon(
                Icons.camera_alt,
                size: 60,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

