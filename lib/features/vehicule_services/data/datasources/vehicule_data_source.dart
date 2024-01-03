import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class VehiculoDataSource {
  final CollectionReference _firebase;
  VehiculoDataSource(this._firebase);

  void addVehicle(Vehicle vehicle) async {
    final uuid = Uuid().v4();
    final Vehicle newVehicle = vehicle.copyWith(id: uuid);
    try {
      await _firebase.doc(newVehicle.id).set(newVehicle.toJson());
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
        value.docs.forEach((element) {
          list.add(Vehicle.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
      return list;
    }
  }

  void modifieVehicle(Vehicle vehicle) async {
    debugPrint('vehicle to update: ${vehicle}');
    try {
      await _firebase.doc(vehicle.id).update(vehicle.toJson());
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    }
  }
}
