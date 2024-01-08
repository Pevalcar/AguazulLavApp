import 'package:aguazullavapp/lib.dart';

class DeleteVehiculo {
  final VehiculoRepository serviceInfoRepository;
  DeleteVehiculo(this.serviceInfoRepository);

  Future<void> call(Vehicle vehiculo) async {
    return serviceInfoRepository.deleteVehicle(vehiculo);
  }
}
