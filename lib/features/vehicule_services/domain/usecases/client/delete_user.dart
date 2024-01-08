
 import 'package:aguazullavapp/features/vehicule_services/domain/repositories/user_data_repository.dart';
import 'package:aguazullavapp/lib.dart';

class DeleteUser {
   final UserDataRepository repository;
  const DeleteUser({required this.repository});
  Future<bool> call(User user){
    return repository.deleteUser(user);
  }

}