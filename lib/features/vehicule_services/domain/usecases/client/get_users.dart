

 import 'package:aguazullavapp/features/vehicule_services/domain/repositories/user_data_repository.dart';
import 'package:aguazullavapp/lib.dart';

class GetUsers {
   final UserDataRepository repository;
  const GetUsers({required this.repository});
  Future<List<User>> call(){
    return repository.getUsers();
  }

}