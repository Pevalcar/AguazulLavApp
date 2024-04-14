import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_service_provider.g.dart';

@riverpod
// ignore: non_constant_identifier_names
FirebaseFirestore FirestoreService(FirestoreServiceRef ref) {
  final firestore = FirebaseFirestore.instance;
  return firestore;
}
