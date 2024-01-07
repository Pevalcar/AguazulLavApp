import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserDataSource {
  final CollectionReference firestore;
  UserDataSource({required this.firestore});

  Future<List<User>> getUsers() async {
    final List<User> list = [];
    try {
      await firestore.get().then((value) {
        value.docs.forEach((element) {
          list.add(User.fromJson(element.data() as Map<String, dynamic>));
        });
      });
      return list;
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
      return list;
    }
  }

  Future<User?> getUser(String id) async {
    try {
      final doc = await firestore.where("id", isEqualTo: id).get();
      return User.fromJson(doc.docs.first.data() as Map<String, dynamic>);
    } on FirebaseException catch (e) {
      debugPrint('error Firebase: ${e.code}');
      return null;
    }
  }

  Future<User?> createUser(User user) async {
    try {
      final userNew = user.copyWith(id: const Uuid().v4());
      await firestore.add(userNew.toJson());
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
}
