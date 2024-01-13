import 'package:aguazullavapp/lib.dart';

class VehiculoRepositoryImpl implements VehiculoRepository {
  final VehiculoDataSource _dataSource;
  VehiculoRepositoryImpl(this._dataSource);

  @override
  Future<void> addVehicle(Vehicle vehicle) async {
    _dataSource.addVehicle(vehicle);
  }

  @override
  Future<void> deleteVehicle(Vehicle vehicle) async {
    _dataSource.deleteVehicle(vehicle);
  }

  @override
  Future<List<Vehicle>> getVehicles() async {
    return _dataSource.getVehicles();
  }

  @override
  Future<void> modifieVehicle(Vehicle vehicle) async {
    _dataSource.modifieVehicle(vehicle);
  }
  
  @override
  Future<List<Vehicle>> getVehiculesToday(List<String> ids) async {
    return _dataSource.getVehiculesToday(ids);
  }
}
