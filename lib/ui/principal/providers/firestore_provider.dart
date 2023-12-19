

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "firestore_provider.g.dart";

final db = FirebaseFirestore.instance;
@riverpod
class ExapleData extends _$ExapleData {
  @override
  FutureOr<String> build() {
    return _fetchs();
  }
  
  _fetchs() async{
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final data = await  db.collection('Servicios').get();
      return data.docs.first.data().toString();
    }) ;
  }
}