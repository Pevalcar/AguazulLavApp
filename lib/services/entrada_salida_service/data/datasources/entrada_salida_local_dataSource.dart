import 'package:aguazullavapp/lib.dart';
import 'package:hive/hive.dart';

class EntradaSalidaLocalDataSource {
  final Box<EntradaSalidaModel> collection;
  EntradaSalidaLocalDataSource(this.collection);
  Future<List<EntradaSalidaModel>> getEntradaSalidas() async {
    return collection.values.toList();
  }

  Future<List<EntradaSalidaModel>> getEntradaSalidasInRange(List<String> ids) async {
    List<EntradaSalidaModel> list0 = collection.values.toList();
    List<EntradaSalidaModel> list = [];

    for (var id in ids) {
      list = list0.where((element) => element.id == id).toList();
    }
    return list;
  }

  Future<void> addEntradaSalida(EntradaSalidaModel entradaSalida) async {
    collection.add(entradaSalida);
  }
  
  Future<void> deleteEntradaSalida(int index) async {
    collection.deleteAt(index);
  }

  Future<void> clear() async {
    collection.clear();
  }
  Future<void> addEntradaSalidas(List<EntradaSalidaModel> list) async {
    collection.addAll(list);
  }
}
