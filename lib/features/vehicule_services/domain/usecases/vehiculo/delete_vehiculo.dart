import 'package:aguazullavapp/lib.dart';

class DeleteVehiculo {
  final VehiculoRepository serviceInfoRepository;
  DeleteVehiculo(this.serviceInfoRepository);

  Future<void> call(String id) async {
    return serviceInfoRepository.deleteVehicle(id);
  }
}
