
import 'package:aguazullavapp/lib.dart';

class GetVehiculos {
  final VehiculoRepository serviceInfoRepository;
  GetVehiculos(this.serviceInfoRepository);

  Future<List<Vehicle>> call() async {
    return serviceInfoRepository.getVehicles();
  }
}