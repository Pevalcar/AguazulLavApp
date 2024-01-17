import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JornadaDataSource {
  final CollectionReference colection;
  JornadaDataSource(this.colection);
  Future<Jornada?> addJornada(Jornada jornada) async {
    try {
      await colection.doc(jornada.id).set(jornada.toJson());
      return jornada;
    } on FirebaseException catch (e) {
      debugPrint('e: ${e}');
      return null;
    }
  }

  Future<void> deleteJornada(Jornada jornada) async {
    try {
      await colection.doc(jornada.id).delete();
    } on FirebaseException catch (e) {
      debugPrint('e: ${e}');
    }
  }

  Future<List<Jornada>> getJornadas() async {
    List<Jornada> list = [];
    try {
      await colection.get().then((value) {
        value.docs.forEach((element) {
          list.add(Jornada.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('e: ${e}');
      return list;
    }
  }

  Future editJornada(Jornada jornada) async {
    try {
      await colection.doc(jornada.id).update(jornada.toJson());
    } on FirebaseException catch (e) {
      debugPrint('e: ${e}');
    }
  }
}
