import 'package:aguazullavapp/lib.dart';

class ModifieUser {
  final UserDataRepository repository;
  const ModifieUser({required this.repository});
  Future<bool> call(User user) {
    return repository.updateUser(user);
  }
}
