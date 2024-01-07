
 import 'package:aguazullavapp/features/vehicule_services/domain/repositories/user_data_repository.dart';
import 'package:aguazullavapp/lib.dart';

class AddUser {
   final UserDataRepository repository;
  const AddUser({required this.repository});
  Future<User?> call(User user){
    return repository.addUser(user);
  }

}