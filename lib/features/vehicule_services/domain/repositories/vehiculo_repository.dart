import 'package:aguazullavapp/lib.dart';

abstract class VehiculoRepository {
  Future<List<Vehicle>> getVehicles();
  Future<void> addVehicle(Vehicle vehicle);
  Future<void> deleteVehicle(Vehicle vehicle);
  Future<void> modifieVehicle(Vehicle vehicle);
}
