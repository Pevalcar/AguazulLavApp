import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VehiculoDataSource {
  final CollectionReference _firebase;
  VehiculoDataSource(this._firebase);

  void addVehicle(Vehicle vehicle) async {
    try {
      await _firebase.doc(vehicle.id).set(vehicle.toJson());
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    }
  }

  void deleteVehicle(Vehicle vehicle) async {
    try {
      await _firebase.doc(vehicle.id).delete();
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    }
  }

//TODO optimizar la bsuqeda de vehiculos por valores
  Future<List<Vehicle>> getVehicles() async {
    List<Vehicle> list = [];
    try {
      await _firebase.orderBy("entrada", descending: true).get().then((value) {
        for (var element in value.docs) {
          list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
      return list;
    }
  }

  void modifieVehicle(Vehicle vehicle) async {
    try {
      await _firebase.doc(vehicle.id).update(vehicle.toJson());
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    }
  }

  getVehiculesToday(List<String> ids) async {
    List<Vehicle> list = [];
    try {
      await _firebase.where('id', whereIn: ids).get().then((value) {
        for (var element in value.docs) {
          list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    }
  }
}
