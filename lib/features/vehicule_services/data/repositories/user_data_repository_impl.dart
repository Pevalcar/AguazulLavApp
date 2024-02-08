
import 'package:aguazullavapp/lib.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataSource dataSource;
  UserDataRepositoryImpl({required this.dataSource});

  @override
  Future<List<Client>> getUsers() async {
    return dataSource.getUsers();
  }

  @override
  Future<Client?> addUser(Client user) async {
    return dataSource.createUser(user) ;
  }
//TODO acer que los repositorios se basen en una interface
  @override
  Future<bool> deleteUser(Client user) async {
    return dataSource.deleteUser(user.id);
  }

  @override
  Future<Client?> getUser(String userId) async {
    return dataSource.getUser(userId) ;
  }

  @override
  Future<bool> updateUser(Client user) async {
    return dataSource.updateUser(user);
  }
}
