import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PinPasDataSource implements IFirestoreDatasourceService<int> {
  final CollectionReference firestoreColection;

  PinPasDataSource(this.firestoreColection);

  String PINNAME = "pin";

  @override
  Future<int?> get(String id) async {
    try {
      DocumentSnapshot<dynamic> documentSnapshot =
          await firestoreColection.doc(PINNAME).get();
      return documentSnapshot.data()![id] as int;
    } on FirebaseException catch (e) {
      logger.e("error get pin", error: e);
    } catch (e) {
      logger.e("error get pin", error: e);
    }
    return null;
  }

  @override
  Future<bool> update(int? data) async {
    try {
      await firestoreColection.doc(PINNAME).set({PINNAME: data});
      return true;
    } on FirebaseException catch (e) {
      logger.e("error Uptadate  pin", error: e);
    } catch (e) {
      logger.e("error Uptadate pin", error: e);
    }

    return false;
  }

  @override
  Future<List<int?>> getAll() => throw UnimplementedError();

  @override
  Future<List<int?>> getByIds(List<String> ids) => throw UnimplementedError();

  @override
  Future<bool> remove(String path) => throw UnimplementedError();

  @override
  Future<bool> add(int? data) => throw UnimplementedError();

  @override
  Future<bool> addAll(List<int?> data) => throw UnimplementedError();
}
