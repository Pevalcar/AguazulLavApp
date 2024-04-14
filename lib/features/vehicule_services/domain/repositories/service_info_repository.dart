// ignore_for_file: non_constant_identifier_names

import 'package:aguazullavapp/lib.dart';

abstract class ServiceTypeRepository {
  Future<List<ServiceType>> GetServicesInfo();
  Future<void> addServiceType(ServiceType service);
  Future<void> deleteServiceType(ServiceType service);
  Future<void> modifieServiceType(ServiceType service);
}
