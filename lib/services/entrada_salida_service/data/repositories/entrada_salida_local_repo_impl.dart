import 'package:aguazullavapp/lib.dart';

class  EntradaSalidaLocalRepositoryImpl implements EntradaSalidaRepository {
  final EntradaSalidaDataSource dataSource;
  EntradaSalidaLocalRepositoryImpl(this.dataSource);
  @override
  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    dataSource.addEntradaSalida(entradaSalida);
  }

  @override
  Future<List<EntradaSalida>> getEntradaSalida() async {
    return dataSource.getEntradaSalidas();
  }

  @override
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida) async {
    dataSource.deleteEntradaSalida(entradaSalida);
  }

  @override
  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids) async {
    return dataSource.getEntradaSalidasInRange(ids);
  }
}
