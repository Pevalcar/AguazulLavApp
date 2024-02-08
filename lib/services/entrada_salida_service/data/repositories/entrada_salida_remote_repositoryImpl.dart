import 'package:aguazullavapp/lib.dart';

class EntradaSalidaRemoteRepositoryImpl implements EntradaSalidaRepository {
  final EntradaSalidaRemoteDataSource dataSource;
  EntradaSalidaRemoteRepositoryImpl(this.dataSource);
  @override
  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    dataSource.addEntradaSalida(entradaSalida);
  }

  @override
  Future<List<EntradaSalida>> getEntradaSalida() async {
    return dataSource.getEntradaSalidas();
  }

  @override
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida , int index) async {
    dataSource.deleteEntradaSalida(entradaSalida);
  }

  @override
  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids) async {
    return await dataSource.getEntradaSalidasInRange(ids);
  }
  
  @override
  Future<void> clearLocal() => throw UnimplementedError();
  
  @override
  Future<void> updateEntradaSalidas(List<EntradaSalida> entradaSalidas) => throw UnimplementedError();
}
