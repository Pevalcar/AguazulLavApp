
import 'package:aguazullavapp/lib.dart';

class AddVehiculo {
  final VehiculoRepository serviceInfoRepository;
  AddVehiculo(this.serviceInfoRepository);

  Future<void> call( Vehicle vehiculo) async {
    return serviceInfoRepository.addVehicle( vehiculo);
  }
}