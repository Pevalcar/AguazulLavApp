import 'package:aguazullavapp/model/car/vehiculo_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../constants/rute/rutes.dart';
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
        onPressed: (Vehicle veicle) {
          Navigator.pushNamed(context, const Rutas.AddService().route,
              arguments: veicle);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, const Rutas.AddService().route,
              arguments: const Vehicle());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ListProces extends StatelessWidget {
  final List<Vehicle> listServices;
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
            vehicle: listServices[index],
            onPressed: onPressed,
          );
        });
  }
}

class CardCarService extends StatelessWidget {
  final Vehicle vehicle;
  final Function onPressed;

  const CardCarService({
    super.key,
    required this.onPressed,
    required this.vehicle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: (vehicle.terminado) ? Colors.green : Colors.red,
      elevation: 7,
      child: ListTile(
        onTap: () {
          onPressed(vehicle);
        },
        title: Text(
          "Propietario: ${vehicle.propietario.name}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        leading: Hero(
          tag: vehicle.id,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              FadeInImage.memoryNetwork(
                  image: vehicle.photo,
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
                Text("Vehiculo: ${vehicle.type}"),
                Text("Servicio: ${vehicle.servicios.name}"),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Entrada: ${vehicle.entrada}"),
                Text("Salida: ${vehicle.salida}"),
              ],
            ),
          ],
        ),
        trailing: Text(" \$ ${vehicle.price}"),
      ),
    );
  }
}

final List<Vehicle> vv = List.generate(50, (index) {
  return Vehicle(
    id: index.toString(),
    photo:
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    type: VeiculoType.autoMovil,
    propietario: User(
      id: index.toString(),
      name: 'Juan $index',
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
