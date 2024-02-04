import 'package:aguazullavapp/lib.dart';
import 'package:hive/hive.dart';

class EntradaSalidaLocalDataSource extends IEntradaSalidaDataSource {
  final Box<EntradaSalida> collection;
  EntradaSalidaLocalDataSource(this.collection);

  @override
  Future<List<EntradaSalida>> getEntradaSalidas() async {
    return collection.values.toList();
  }

  @override
  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids) async {
    List<EntradaSalida> list0 = collection.values.toList();
    List<EntradaSalida> list = [];

    for (var id in ids) {
      list = list0.where((element) => element.id == id).toList();
    }
    return list;
  }

  @override
  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    collection.add(entradaSalida);
  }

  @override
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida) async {
    collection.delete(entradaSalida.id);
  }

  Future<void> clear() async {
    collection.clear();
  }
}
