import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../constants/rute/rutes.dart';
import '../../model/models.dart';
import 'card/service_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car wash Aguazul'),
        elevation: 10,
      ),
      body: _ListProcess(
        listServices: vv,
        onPressed: (Vehicle veicle) {
          Navigator.pushNamed(context, const Rutas.AddService().route);
          ref.read(vehiculoProvider.notifier).ModifierVeichle(veicle);
          
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

class _ListProcess extends StatelessWidget {
  final List<Vehicle> listServices;
  final Function onPressed;

  const _ListProcess({
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
    servicios: ServiceInfo(),
    terminado: false,
    price: '15.000',
    placa: 'ABC-$index',
  );
});
