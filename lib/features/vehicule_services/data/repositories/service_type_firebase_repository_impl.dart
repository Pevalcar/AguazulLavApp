// ignore_for_file: non_constant_identifier_names

import 'package:aguazullavapp/lib.dart';

class ServiceTypeFirebaseRepositoryImpl implements ServiceTypeRepository {
  final ServiceTypeFireStoreDatasource _localDataSource;
  ServiceTypeFirebaseRepositoryImpl(this._localDataSource);

  @override
  Future<List<ServiceType>> GetServicesInfo() async {
    return _localDataSource.GetServiceType();
  }

  @override
  Future<void> addServiceType(ServiceType service) async {
    _localDataSource.addServiceType(service);
  }

  @override
  Future<void> deleteServiceType(ServiceType service) async {
    _localDataSource.deleteServiceType(service);
  }

  @override
  Future<void> modifieServiceType(ServiceType service) async {
    _localDataSource.modifieServiceType(service);
  }
}
