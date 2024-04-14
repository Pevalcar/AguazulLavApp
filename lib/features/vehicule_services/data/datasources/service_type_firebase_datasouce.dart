// ignore_for_file: non_constant_identifier_names

import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ServiceTypeFireStoreDatasource {
  final CollectionReference _firestore;
  ServiceTypeFireStoreDatasource(this._firestore);

  Future<List<ServiceType>> GetServiceType() async {
    List<ServiceType> list = [];

    try {
      final count = await _firestore.count().get();
      list = await _getServicesType();
      if (list.isEmpty && count.count != list.length) {
        logger.i(' getServicesType firestore');
        await _firestore.get().then((value) {
          for (var element in value.docs) {
            list.add(
                ServiceType.fromJson(element.data() as Map<String, dynamic>));
          }
        });
        return list;
      }
      return list;
    } on FirebaseException catch (e) {
      logger.i('error GetServiceType: $e');
    } catch (e) {
      logger.i('error GetServiceType: ${e.toString()}');
    }
    return list;
  }

  void addServiceType(ServiceType service) async {
    final uuid = const Uuid().v4();
    ServiceType serviceType = service.copyWith(servicioId: uuid);
    try {
      await _firestore.doc(serviceType.servicioId).set(serviceType.toJson());
    } on FirebaseException catch (e) {
      logger.i('error GetServiceType: $e');
    } catch (e) {
      logger.i('error GetServiceType: ${e.toString()}');
    }
  }

  void deleteServiceType(ServiceType service) async {
    try {
      await _firestore.doc(service.servicioId).delete();
    } on FirebaseException catch (e) {
      logger.i('error GetServiceType: $e');
    } catch (e) {
      logger.i('error GetServiceType: ${e.toString()}');
    }
  }

  void modifieServiceType(ServiceType service) async {
    try {
      await _firestore.doc(service.servicioId).update(service.toJson());
    } on FirebaseException catch (e) {
      logger.i('error GetServiceType: $e');
    } catch (e) {
      logger.i('error GetServiceType: ${e.toString()}');
    }
  }

  Future<List<ServiceType>> _getServicesType() async {
    List<ServiceType> list = [];
    try {
      await _firestore
          .get(const GetOptions(source: Source.cache))
          .then((value) {
        for (var element in value.docs) {
          list.add(
              ServiceType.fromJson(element.data() as Map<String, dynamic>));
        }
      });
      return list;
    } on FirebaseException catch (e) {
      logger.i('e: ${e.toString()}');
    } catch (e) {
      logger.i('e: ${e.toString()}');
    }
    return list;
  }
}
