import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserDataSource {
  final CollectionReference firestore;
  UserDataSource({required this.firestore});

  Future<List<Client>> getUsers() async {
    List<Client> list = [];
    try {
      list = [] ;

      if (list.isEmpty) {
        debugPrint('getUSers firestore');
        //ordenardos alfabeticamente
        await firestore.orderBy('name', descending: false).get().then((value) {
          for (var element in value.docs) {
            list.add(Client.fromJson(element.data() as Map<String, dynamic>));
          }
        });
        debugPrint(' getUSers return remote');
        return list;
      }
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
      rethrow;
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<Client?> getUser(String id) async {
    if (id.isEmpty) return null;
    if (id == '1234') return null;
    Client? user;
    try {
      user = await _getUserLocal(id);
      if (user == null) {
        await firestore.doc(id).get().then((value) {
          user = Client.fromJson(value.data() as Map<String, dynamic>);
          logger.d(' getUSersLocal');
        });
        return user;
      }
      return user;
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return user;
  }

  Future<Client?> createUser(Client user) async {
    try {
      final userNew = user.copyWith(id: const Uuid().v4(), name: user.name.toUpperCase());
      await firestore.doc(userNew.id).set(userNew.toJson());
      return userNew;
    } on FirebaseException catch (e) {
      logger.e('error al crear Usuario: $e');
      return null;
    } catch (e) {
      logger.e('error al crear Usuario: $e');
    }
  }

  Future<bool> updateUser(Client user) async {

    try {
      await firestore.doc(user.id).update(user.copyWith(name: user.name.toUpperCase()).toJson());
      return true;
    } on FirebaseException catch (e) {
      logger.e('error al actualizar Usuario: $e');
      return false;
    } catch (e) {
      logger.e('error al actualizar Usuario: $e');
      return false;
    } 

  }

  Future<bool> deleteUser(String id) async {
    try {
      await firestore.doc(id).delete();
      return true;
    } on FirebaseException catch (e) {
      logger.e('error al borrar Usuario: $e');
      return false;
    } catch (e) {
      logger.e('error al borrar Usuario: $e');
      return false;
    }
  }

  Future<List<Client>> _getUSersLocal() async {
    final List<Client> list = [];
    debugPrint(' getUSersLocal');
    try {
      await firestore.orderBy('name', descending: false).get(const GetOptions(source: Source.cache)).then((value) {
        for (var element in value.docs) {
          list.add(Client.fromJson(element.data() as Map<String, dynamic>));
        }
      });
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
      rethrow;
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return list;
  }

  Future<Client?> _getUserLocal(String id) async {
    Client? user;
    logger.d(' getUSersLocal');
    try {
      await firestore
          .doc(id)
          .get(
            const GetOptions(source: Source.cache),
          )
          .then((value) {
        user = Client.fromJson(value.data() as Map<String, dynamic>);
      });
    } on FirebaseException catch (e) {
      logger.e('error Firebase', error: e.toString());
    } catch (e) {
      logger.e('error Firebase', error: e.toString());
    }
    return user;
  }
}
