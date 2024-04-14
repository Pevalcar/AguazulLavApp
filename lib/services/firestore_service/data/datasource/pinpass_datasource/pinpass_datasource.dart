import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigsDataSource implements IFirestoreDatasourceService<int> {
  final CollectionReference firestoreColection;

  ConfigsDataSource(this.firestoreColection);

  // ignore: non_constant_identifier_names
  static String PINNAME = "configs";

  @override
  Future<int?> get(String id) async {
    int? result;
    try {
      DocumentSnapshot<dynamic> documentSnapshot =
          await firestoreColection.doc(PINNAME).get();
      result = documentSnapshot.data()![id] as int;
    } on FirebaseException catch (e) {
      logger.e("error get pin", error: e);
      rethrow;
    } catch (e) {
      logger.e("error get pin", error: e);
    }
    return result;
  }

  @override
  Future<bool> update(int? data, String id) async {
    try {
      await firestoreColection
          .doc(PINNAME)
          .set({id: data}, SetOptions(merge: true));
      return true;
    } on FirebaseException catch (e) {
      logger.e("error Uptadate  pin", error: e);
    } catch (e) {
      logger.e("error Uptadate pin", error: e);
    }

    return false;
  }

  Future<ConfiguracionModel?> getConfiguraciones() async {
    ConfiguracionModel? result;
    try {
      await firestoreColection.doc("configuraciones").get().then((value) {
        result =
            ConfiguracionModel.fromJson(value.data() as Map<String, dynamic>);
      });
    } on FirebaseException catch (e) {
      logger.e("error Uptadate  pin", error: e);
    } catch (e) {
      logger.e("error Uptadate pin", error: e);
    }

    return result;
  }

  Future<bool> updateConfiguraciones(ConfiguracionModel? data) async {
    try {
      await firestoreColection
          .doc("configuraciones")
          .set(data!.toJson(), SetOptions(merge: true));
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
