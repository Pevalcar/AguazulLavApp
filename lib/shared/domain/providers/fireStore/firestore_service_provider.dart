

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_service_provider.g.dart';

@riverpod
FirebaseFirestore FirestoreService(FirestoreServiceRef ref) {
  final firestore = FirebaseFirestore.instance;
  return  firestore;
}