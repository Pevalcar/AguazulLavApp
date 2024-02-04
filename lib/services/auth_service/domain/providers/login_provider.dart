

import 'package:aguazullavapp/lib.dart';
import 'package:aguazullavapp/shared/domain/providers/fireAuth/fire_auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';
@riverpod
FirebaseAuthDataSource authFireSourceProvider(AuthFireSourceProviderRef ref) {
  final auth = ref.watch(fireAuthInstanceProvider);
  return FirebaseAuthDataSource(auth);
}


@riverpod
FirebaseAuthRepository authFireRepo(AuthFireRepoRef ref) {
  final authFireSource = ref.watch(authFireSourceProviderProvider);
  return FirebaseAuthRepository(authFireSource);
}