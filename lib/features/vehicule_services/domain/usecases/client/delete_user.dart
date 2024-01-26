
import 'package:aguazullavapp/lib.dart';

class DeleteUser {
   final UserDataRepository repository;
  const DeleteUser({required this.repository});
  Future<bool> call(User user){
    return repository.deleteUser(user);
  }

}