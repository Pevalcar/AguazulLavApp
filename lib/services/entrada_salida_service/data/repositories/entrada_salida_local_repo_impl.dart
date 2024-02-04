import 'package:aguazullavapp/lib.dart';

class  EntradaSalidaLocalRepositoryImpl implements EntradaSalidaRepository {
  final EntradaSalidaLocalDataSource dataSourceLocal;
  EntradaSalidaLocalRepositoryImpl(this.dataSourceLocal);
  @override
  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    final EntradaSalidaModel entradaSalidaModel = EntradaSalidaModel.fromEntity(
      entradaSalida,
    );
    return dataSourceLocal.addEntradaSalida(entradaSalidaModel);
  }

  @override
  Future<List<EntradaSalida>> getEntradaSalida() async {
    final List<EntradaSalidaModel> entradaSalidaModels =
        dataSourceLocal.getEntradaSalidas();
    List<EntradaSalida> entradaSalidas =
        entradaSalidaModels.map((e) => e.toEntity()).toList();
    return entradaSalidas;
  }

  @override
  Future<void> deleteEntradaSalida(
      EntradaSalida entradaSalida, int index) async {
   return dataSourceLocal.deleteEntradaSalida(index);
  }

  @override
  Future<void> clearLocal() async {
    return dataSourceLocal.clear();
  }

  @override
  Future<void> updateEntradaSalidas(List<EntradaSalida> entradaSalidas) async {
    List<EntradaSalidaModel> entradaSalidaModels =
        entradaSalidas.map((e) => EntradaSalidaModel.fromEntity(e)).toList();
    await dataSourceLocal.clear();
    return await dataSourceLocal.addEntradaSalidas(entradaSalidaModels);
  }
  
  @override
  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids) async => throw UnimplementedError();
}
