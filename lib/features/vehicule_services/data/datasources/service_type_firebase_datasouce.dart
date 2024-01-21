import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ServiceTypeFireStoreDatasource {
  final CollectionReference _firestore;
  ServiceTypeFireStoreDatasource(this._firestore);

  Future<List<ServiceType>> GetServiceType() async {
    List<ServiceType> list = [];

    try {
      list = await _getServicesType();
      if (list.isEmpty) {
        debugPrint(' getServicesType firestore');
        await _firestore.get().then((value) {
          value.docs.forEach((element) {
            list.add(
                ServiceType.fromJson(element.data() as Map<String, dynamic>));
          });
        });
        return list;
      }
      return list;
    } on FirebaseException catch (e) {
      debugPrint('e: ${e}');
    } catch (e) {
      debugPrint('e: ${e.toString()}');
    }
    return list;
  }

  void addServiceType(ServiceType service) async {
    final uuid = const Uuid().v4();
    ServiceType serviceType = service.copyWith(servicioId: uuid);
    try {
      await _firestore.doc(serviceType.servicioId).set(serviceType.toJson());
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

  Future<List<ServiceType>> _getServicesType() async {
    List<ServiceType> list = [];
    try {
      await _firestore.get(GetOptions(source: Source.cache)).then((value) {
        for (var element in value.docs) {
          list.add(
              ServiceType.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('e: ${e.toString()}');
    } catch (e) {
      debugPrint('e: ${e.toString()}');
    }
    return list;
  }
}
