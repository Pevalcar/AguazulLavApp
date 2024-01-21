import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserDataSource {
  final CollectionReference firestore;
  UserDataSource({required this.firestore});

  Future<List<User>> getUsers() async {
    List<User> list = [];
    try {
      list = await _getUSersLocal();

      if (list.isEmpty) {
        debugPrint(' getUSers firestore');
        await firestore.get().then((value) {
          value.docs.forEach((element) {
            list.add(User.fromJson(element.data() as Map<String, dynamic>));
          });
        });
        debugPrint(' getUSers return remote');
        return list;
      }
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    } catch (e) {
      debugPrint('error: ${e.toString()}');
    }
    return list;
  }

  Future<User?> getUser(String id) async {
    if (id.isEmpty) return null;
    if (id == '1234') return null;
    User? _user;
    try {
      _user = await _getUserLocal(id);
      if (_user == null) {
        await firestore.doc(id).get().then((value) {
          _user = User.fromJson(value.data() as Map<String, dynamic>);
        });
        return _user;
      }
      return _user;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    } catch (e) {
      debugPrint('error: ${e.toString()}');
    }
    return _user;
  }

  Future<User?> createUser(User user) async {
    try {
      final userNew = user.copyWith(id: const Uuid().v4());
      await firestore.doc(userNew.id).set(userNew.toJson());
      return userNew;
    } on FirebaseException catch (e) {
      debugPrint('error al crear Usuario: ${e}');
      return null;
    }
  }

  Future<bool> updateUser(User user) async {
    try {
      await firestore.doc(user.id).update(user.toJson());
      return true;
    } on FirebaseException catch (e) {
      debugPrint('error al actualizar Usuario: ${e}');
      return false;
    }
  }

  Future<bool> deleteUser(String id) async {
    try {
      await firestore.doc(id).delete();
      return true;
    } on FirebaseException catch (e) {
      debugPrint('error al borrar Usuario: ${e}');
      return false;
    }
  }

  Future<List<User>> _getUSersLocal() async {
    final List<User> list = [];
    debugPrint(' getUSersLocal');
    try {
      await firestore.get(const GetOptions(source: Source.cache)).then((value) {
        value.docs.forEach((element) {
          list.add(User.fromJson(element.data() as Map<String, dynamic>));
        });
      });
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    } catch (e) {
      debugPrint('error: ${e.toString()}');
    }
    return list;
  }

  Future<User?> _getUserLocal(String id) async {
    User? user;
    try {
      await firestore
          .doc(id)
          .get(
            const GetOptions(source: Source.cache),
          )
          .then((value) {
            
        user = User.fromJson(value.data() as Map<String, dynamic>);
      });
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
    } catch (e) {
      debugPrint('error: ${e.toString()}');
    }
    return user;
  }
}
