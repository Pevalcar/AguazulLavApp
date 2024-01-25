import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "pin_pass_provider.g.dart";

@riverpod
class PinPass extends _$PinPass {
  @override
  Future<int?> build() async {
    return _featchPin();
  }

  Future<int?> _featchPin() async {
    return await PinPassProvider().getPin();
  }

  void setPin(int value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(( ) async {
      await PinPassProvider().setPin(value);
      return value;
    });
  }

}

class PinPassProvider {
  PinPassProvider();
  final CollectionReference _firebase =
      FirebaseFirestore.instance.collection('Controllers');

  Future<void> setPin(int value) async {
    try {
      await _firebase.doc('pin').set({'pass': value});
    } catch (e) {
      print(e);
    }
  }

  Future<int?> getPin() async {
    try {
      DocumentSnapshot<dynamic> documentSnapshot =
          await _firebase.doc('pin').get();
      return documentSnapshot.data()!['pass'] as int;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
