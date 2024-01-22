import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EntradaSalidaDataSource {
  final CollectionReference collection;
  EntradaSalidaDataSource(this.collection);

  Future<List<EntradaSalida>> getEntradaSalidas() async {
    List<EntradaSalida> list = [];
    try {
      list = await _getEntrdadasSalidasLocal();
      if (list.isEmpty) {
        collection.get().then((value) {
          value.docs.forEach((element) {
            list.add(
                EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
          });
        });
      }
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<List<EntradaSalida>> _getEntrdadasSalidasLocal() async {
    List<EntradaSalida> list = [];
    try {
      await collection
          .orderBy("fecha", descending: true)
          .get(const GetOptions(source: Source.cache))
          .then((value) {
        value.docs.forEach((element) {
          list.add(
              EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
      return list;
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids) async {
    List<EntradaSalida> list = [];
    try {
      list = await _getEntradaSalidasInRangeLocal(ids);
      if (list.isEmpty || list.length < ids.length) {
        collection.where("id", whereIn: ids).get().then((value) {
          value.docs.forEach((element) {
            list.add(
                EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
          });
        });
      }
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<List<EntradaSalida>> _getEntradaSalidasInRangeLocal(
      List<String> ids) async {
    List<EntradaSalida> list = [];
    try {
      await collection
          .where("id", whereIn: ids)
          .orderBy("fecha", descending: true)
          .get(const GetOptions(source: Source.cache))
          .then((value) {
        value.docs.forEach((element) {
          list.add(
              EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    try {
      await collection.doc(entradaSalida.id).set(entradaSalida.toJson());
    } on FirebaseException catch (e) {
      logger.e('error al intentar agregar: ${e}');
    }
  }

  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida) async {
    try {
      await collection.doc(entradaSalida.id).delete();
    } on FirebaseException catch (e) {
      logger.e('error al intentar eliminar: ${e}');
    }
  }
}
