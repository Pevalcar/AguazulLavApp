import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ServiceTypeFireStoreDatasource {
  final CollectionReference _firestore;
  ServiceTypeFireStoreDatasource(this._firestore);

  Future<List<ServiceType>> GetServiceType() async {
    List<ServiceType> list = [];

    try {
      await _firestore.get().then((value) {
        value.docs.forEach((element) {
          list.add(
              ServiceType.fromJson(element.data() as Map<String, dynamic>));
        });
      });

      debugPrint('list: ${list}');
      return list;
    } on FirebaseException catch (e) {
      print(e.toString());
      return list;
    }
  }

  void addServiceType(ServiceType service) async {
    try {
      await _firestore.add(service.toJson());
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  void deleteServiceType(ServiceType service) async {
    try {
      await _firestore.doc(service.servicioId).delete();
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  void modifieServiceType(ServiceType service) async {
    try {
     await _firestore.doc(service.servicioId).update(service.toJson());
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
