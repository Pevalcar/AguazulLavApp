import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VehiculoDataSource {
  final CollectionReference _firebase;
  VehiculoDataSource(this._firebase);

//TODO optimizar la bsuqeda de vehiculos por valores y agregando a la base d e datos locales
  Future<List<Vehicle>> getVehicles() async {
    List<Vehicle> list = [];
    try {
      list = await _getVehiclesLocal();
      if (list.isEmpty) {
        _firebase.orderBy("entrada", descending: true).get().then((value) {
          for (var element in value.docs) {
            list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
          }
        });
        return list;
      }
      return list;
    } on FirebaseException catch (e) {
      logger.e("error Firebase", error: e.code);
    } catch (e) {
      logger.e('error cargar vehiculos', error: e.toString());
    }
    return list;
  }

  Future<List<Vehicle>> getVehiculesToday(List<String> ids) async {
    List<Vehicle> list = [];
    try {
      list = await _getVehiculesTodayLocal(ids);
      if (list.isEmpty || list.length < ids.length) {
        _firebase
            .where('id', whereIn: ids)
            .orderBy("entrada", descending: true)
            .get()
            .then((value) {
          for (var element in value.docs) {
            list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
          }
          logger.i("cargando vehivulos de la base de datos remota");
        });
        return list;
      }
      logger.i("cargando vehivulos de la base de datos local");
      return list;
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  void addVehicle(Vehicle vehicle) async {
    try {
      await _firebase.doc(vehicle.id).set(vehicle.toJson());
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
  }

  void deleteVehicle(Vehicle vehicle) async {
    try {
      await _firebase.doc(vehicle.id).delete();
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
  }

  void modifieVehicle(Vehicle vehicle) async {
    try {
      await _firebase.doc(vehicle.id).update(vehicle.toJson());
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
  }

  Future<List<Vehicle>> _getVehiclesLocal() async {
    List<Vehicle> list = [];
    try {
      await _firebase
          .orderBy("entrada", descending: true)
          .get(const GetOptions(source: Source.cache))
          .then((value) {
        for (var element in value.docs) {
          list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      return list;
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<List<Vehicle>> _getVehiculesTodayLocal(List<String> ids) async {
    List<Vehicle> list = [];
    try {
      await _firebase
          .where('id', whereIn: ids)
          .orderBy("entrada", descending: true)
          .get(const GetOptions(source: Source.cache))
          .then((value) {
        for (var element in value.docs) {
          list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      return list;
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
      return list;
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
      return list;
    }
  }
}
