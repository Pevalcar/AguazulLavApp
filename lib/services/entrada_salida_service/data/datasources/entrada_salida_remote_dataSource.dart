import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class EntradaSalidaRemoteDataSource  implements IEntradaSalidaDataSource {
  final CollectionReference collection;
  EntradaSalidaRemoteDataSource(this.collection);

  @override
  Future<List<EntradaSalida>> getEntradaSalidas() async {
    List<EntradaSalida> list = [];
    try {
        collection.get().then((value) {
          for (var element in value.docs) {
            list.add(
                EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
          }
        });
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }


  @override
  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids) async {
    List<EntradaSalida> list = [];
    try {
        collection.where("id", whereIn: ids).get().then((value) {
          for (var element in value.docs) {
            list.add(
                EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
          }
        });
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }


  @override
  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    try {
      await collection.doc(entradaSalida.id).set(entradaSalida.toJson());
    } on FirebaseException catch (e) {
      logger.e('error al intentar agregar: $e');
    }
  }

  @override
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida) async {
    try {
      await collection.doc(entradaSalida.id).delete();
    } on FirebaseException catch (e) {
      logger.e('error al intentar eliminar: $e');
    }
  }
}
