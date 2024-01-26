

import 'package:aguazullavapp/lib.dart';

class GetUsers {
   final UserDataRepository repository;
  const GetUsers({required this.repository});
  Future<List<User>> call(){
    return repository.getUsers();
  }

}