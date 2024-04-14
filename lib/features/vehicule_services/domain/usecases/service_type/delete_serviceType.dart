// ignore_for_file: file_names

import 'package:aguazullavapp/lib.dart';

class DeleteServiceType {
  final ServiceTypeRepository serviceInfoRepository;
  DeleteServiceType(this.serviceInfoRepository);
  Future<void> call(ServiceType service) {
    return serviceInfoRepository.deleteServiceType(service);
  }
}
