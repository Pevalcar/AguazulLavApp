import 'package:aguazullavapp/lib.dart';

class GetVehiculesToday {
  final VehiculoRepositoryImpl repository;
  const GetVehiculesToday(this.repository);
  Future<List<Vehicle>> call(List<String> ids) {
    return repository.getVehiculesToday(ids);
  }
}
