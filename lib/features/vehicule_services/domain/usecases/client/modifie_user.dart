import 'package:aguazullavapp/lib.dart';

class ModifieUser {
  final UserDataRepository repository;
  const ModifieUser({required this.repository});
  Future<bool> call(Client user) {
    return repository.updateUser(user);
  }
}
