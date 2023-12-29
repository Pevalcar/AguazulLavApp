import 'package:aguazullavapp/lib.dart';

class ListServicesRepository {
  Future<List<Vehicle>> GetServicesData() async {
    await Future.delayed(const Duration(seconds: 3));
    return vv;
  }

  Future<List<Vehicle>> addService(Vehicle vehiculo) async {
    await Future.delayed(const Duration(seconds: 1));
    vv.add(vehiculo);
    return vv;
  }

  Future deleteService(Vehicle vehiculo) async {
    await Future.delayed(const Duration(seconds: 1));
    vv.remove(vehiculo);
    return vv;
  }

  endService(Vehicle vehiculo) async {
    await Future.delayed(const Duration(seconds: 1));
    vv = vv.map((e) {
      if (e.id == vehiculo.id) {
        e = e.copyWith(terminado: true);
      }
      return e;
    }).toList();
  }
}

List<Vehicle> vv = List.generate(3, (index) {
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
    servicios: const ServiceType(),
    terminado: false,
    price: '15.000',
    placa: 'ABC-$index',
  );
});
