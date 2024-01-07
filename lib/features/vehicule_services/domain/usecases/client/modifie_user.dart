import 'package:aguazullavapp/features/vehicule_services/domain/repositories/user_data_repository.dart';
import 'package:aguazullavapp/lib.dart';

class ModifieUser {
  final UserDataRepository repository;
  const ModifieUser({required this.repository});
  Future<bool> call(User user) {
    return repository.updateUser(user);
  }
}
