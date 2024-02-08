

import 'package:aguazullavapp/lib.dart';

class GetUsers {
   final UserDataRepository repository;
  const GetUsers({required this.repository});
  Future<List<Client>> call(){
    return repository.getUsers();
  }

}