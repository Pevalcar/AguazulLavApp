
import 'package:aguazullavapp/lib.dart';

class AddUser {
   final UserDataRepository repository;
  const AddUser({required this.repository});
  Future<Client?> call(Client user){
    return repository.addUser(user);
  }

}