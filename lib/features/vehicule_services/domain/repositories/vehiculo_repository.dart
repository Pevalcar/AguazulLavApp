import 'package:aguazullavapp/lib.dart';

abstract class VehiculoRepository {
  Future<List<Vehicle>> getVehicles();
  Future<void> addVehicle(Vehicle vehicle);
  Future<void> deleteVehicle(String id);
  Future<void> modifieVehicle(Vehicle vehicle);
  Future<List<Vehicle>> getVehiculesToday(List<String> ids);
}
