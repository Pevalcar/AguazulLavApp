import 'package:aguazullavapp/lib.dart';

class HasUser {
  final UserCacheRepositoryImpl repo;
  HasUser(this.repo);
  Future<bool> call() {
    return repo.hasUser();
  }
}
