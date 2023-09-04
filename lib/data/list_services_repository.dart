import 'package:aguazullavapp/model/models.dart';

class ListServicesRepository {
  Future<List<Vehicle>> GetServicesData() async {

    
    await Future.delayed(Duration(seconds: 3));
    return vv;
  }

  Future<List<Vehicle>> addService(Vehicle vehiculo) async {
    await Future.delayed(const Duration(seconds: 2));
    vv.add(vehiculo);
    return vv;
  }
}

final List<Vehicle> vv = List.generate(3, (index) {
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
    salida: "",
    servicios: ServiceInfo(),
    terminado: false,
    price: '15.000',
    placa: 'ABC-$index',
  );
});
