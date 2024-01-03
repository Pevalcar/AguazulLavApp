
import 'package:aguazullavapp/lib.dart';

class ModifiVehiculo {
  final VehiculoRepository serviceInfoRepository;
  ModifiVehiculo(this.serviceInfoRepository);

  Future<void> call( Vehicle vehiculo) async {
    return serviceInfoRepository.modifieVehicle( vehiculo);
  }
}