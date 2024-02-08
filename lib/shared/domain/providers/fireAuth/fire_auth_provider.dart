import 'package:firebase_auth/firebase_auth.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fire_auth_provider.g.dart';

@riverpod
FirebaseAuth FireAuthInstance(FireAuthInstanceRef ref) {
  return FirebaseAuth.instance;
}
