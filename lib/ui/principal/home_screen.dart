import 'package:aguazullavapp/model/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../constants/rutes.dart';
import '../../model/propietary/user.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car wash Aguazul'),
        elevation: 10,
      ),
      body: _ListProces(
        listServices: vv,
        onPressed: (veicle) {

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Rutas.AddService.name) ;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ListProces extends StatelessWidget {
  final List<Veiculo> listServices;
  final Function onPressed;

  const _ListProces({
    required this.listServices,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listServices.length,
        itemBuilder: (context, index) {
          return CardCarService(
            veicle: listServices[index],
            onPressed: onPressed,
          );
        });
  }
}

class CardCarService extends StatelessWidget {
  final Veiculo veicle;
  final Function onPressed;

  const CardCarService({
    super.key,
    required this.onPressed,
    required this.veicle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: (veicle.terminado) ? Colors.green : Colors.red,
      elevation: 7,
      child: ListTile(
        onTap: () {
          onPressed(veicle);
        },
        title: Text(
          "Propietario: ${veicle.propietario.name}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        leading: Hero(
          tag: veicle.id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              FadeInImage.memoryNetwork(
                  image: veicle.photo,
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover),
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Vehiculo: ${veicle.type.name}"),
                Text("Servicio: ${veicle.servicios.name}"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Entrada: ${veicle.entrada}"),
                Text("Salida: ${veicle.salida}"),
              ],
            ),
          ],
        ),
        trailing: Text(" \$ ${veicle.price}"),
      ),
    );
  }
}

final List<Veiculo> vv = List.generate(50, (index) {
  return Veiculo(
    id: index.toString(),
    photo:
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    type: VeiculoType.AutoMovil,
    propietario: User(
      id: index.toString(),
      name: 'Juan ${index}',
      phone: '123456',
      email: 'jF5gK@example.com',
      photo: '',
      address: '',
      bonus: '',
    ),
    entrada: '2022-01-01',
    salida: "-",
    servicios: Servicio.Pro,
    terminado: true,
    price: '15.000',
  );
});
