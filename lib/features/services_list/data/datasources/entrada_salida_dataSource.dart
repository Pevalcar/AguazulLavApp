import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EntradaSalidaDataSource {
  final CollectionReference colection;
  EntradaSalidaDataSource(this.colection);

  Future<List<EntradaSalida>> getEntradaSalidas() async {
      List<EntradaSalida> list = [];
    try {
      await colection.orderBy("fecha", descending: true).get().then((value) {
        value.docs.forEach((element) {
          list.add(
              EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
      return list;
    }
  }

  Future<List<EntradaSalida>> getEntradaSalidasInRange( List<String> ids) async {
      List<EntradaSalida> list = [];
    try {
      await colection
          .where("id", whereIn: ids)
          .orderBy("fecha", descending: true)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          list.add(
              EntradaSalida.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
      return list;
    } catch (e) {
      debugPrint('error Firebase: ${e.toString()}');
      return list;
    }
  }

  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    try {
      await colection.doc(entradaSalida.id).set(entradaSalida.toJson());
    } on FirebaseException catch (e) {
      debugPrint('error al intentar agregar: ${e}');
    }
  }

  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida) async {
    try {
      await colection.doc(entradaSalida.id).delete();
    } on FirebaseException catch (e) {
      debugPrint('error al intentar eliminar: ${e}');
    }
  }
}
