import 'package:aguazullavapp/lib.dart';

abstract class ServiceTypeRepository {
  Future<List<ServiceType>> GetServicesInfo();
  Future<void> addServiceType(ServiceType service);
  Future<void> deleteServiceType(ServiceType service);
  Future<void> modifieServiceType( ServiceType service);
}
