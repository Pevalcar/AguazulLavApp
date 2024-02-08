import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JornadaDataSource {
  final CollectionReference colection;
  JornadaDataSource(this.colection);

  Future<List<Jornada>> getJornadas() async {
    List<Jornada> list = [];
    try {
      await colection.orderBy('dateInit', descending: true).get().then((value) {
        for (var element in value.docs) {
          list.add(Jornada.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      logger.i('jornadas cargadas');
      return list;
    } on FirebaseException catch (e) {
      logger.e('error cargar jornadas desde ', error: e.toString());
      return list;
    } catch (e) {
      logger.e('error cargar jornadas', error: e.toString());
    }
    return list;
  }

  Future<Jornada?> addJornada(Jornada jornada) async {
    Jornada? jornada0;
    try {
      await colection.doc(jornada.id).set(jornada.toJson());
      return jornada0;
    } on FirebaseException catch (e) {
      debugPrint('e: $e');
      return null;
    }
  }

  Future<void> deleteJornada(Jornada jornada) async {
    try {
      await colection.doc(jornada.id).delete();
    } on FirebaseException catch (e) {
      debugPrint('e: $e');
    } catch (e) {
      logger.e("error al eliminar  la jornada", error: e.toString());
    }
  }

  Future editJornada(Jornada jornada) async {
    try {
      await colection.doc(jornada.id).update(jornada.toJson());
    } on FirebaseException catch (e) {
      logger.e('error al editar la jornada',
          error: e.code, stackTrace: e.stackTrace);
    } catch (e) {
      logger.e('error al editar la jornada', error: e.toString());
    }
  }

/*TODO: 
crear un index que contenga la información la la jornada actual, con esto
solo se puede cargar la jornada actual
*/
  Future<Jornada?> getCurrentJornada() async {
    Jornada? jornada;
    try {
      await colection.where('dateEnd', isNull: true).get().then((value) {
        if (value.docs.isNotEmpty) {
          jornada =
              Jornada.fromJson(value.docs.first.data() as Map<String, dynamic>);
          return jornada;
        } else {
          jornada = null;
        }
      });
    } on FirebaseException catch (e) {
      logger.e('error cargar jornadas desde ', error: e.toString());
    } catch (e) {
      logger.e('error cargar jornadas', error: e.toString());
    }
    return jornada;
  }
}
