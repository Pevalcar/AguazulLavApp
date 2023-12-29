
import 'package:aguazullavapp/lib.dart';

class AddServiceType {
  final ServiceTypeRepository serviceInfoRepository;
  AddServiceType(this.serviceInfoRepository);

  Future<void> call( ServiceType service) async {
    return serviceInfoRepository.addServiceType( service);
  }
}