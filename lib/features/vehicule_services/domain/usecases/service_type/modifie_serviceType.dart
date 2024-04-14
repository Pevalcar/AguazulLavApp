// ignore_for_file: file_names

import 'package:aguazullavapp/lib.dart';

class ModifieServiceType {
  final ServiceTypeRepository serviceInfoRepository;

  ModifieServiceType(this.serviceInfoRepository);

  Future<void> call(ServiceType service) {
    return serviceInfoRepository.modifieServiceType(service);
  }
}
