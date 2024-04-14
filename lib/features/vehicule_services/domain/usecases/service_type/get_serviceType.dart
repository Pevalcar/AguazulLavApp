// ignore_for_file: file_names

import 'package:aguazullavapp/lib.dart';

class GetServiceType {
  final ServiceTypeRepository serviceInfoRepository;
  GetServiceType(this.serviceInfoRepository);

  Future<List<ServiceType>> call() async {
    return serviceInfoRepository.GetServicesInfo();
  }
}
