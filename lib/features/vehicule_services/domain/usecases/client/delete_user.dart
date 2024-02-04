
import 'package:aguazullavapp/lib.dart';

class DeleteClient {
   final UserDataRepository repository;
  const DeleteClient({required this.repository});
  Future<bool> call(Client user){
    return repository.deleteUser(user);
  }

}