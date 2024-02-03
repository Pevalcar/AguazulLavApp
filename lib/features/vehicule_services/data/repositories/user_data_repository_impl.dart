
import 'package:aguazullavapp/lib.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataSource dataSource;
  UserDataRepositoryImpl({required this.dataSource});

  @override
  Future<List<User>> getUsers() async {
    return dataSource.getUsers();
  }

  @override
  Future<User?> addUser(User user) async {
    return dataSource.createUser(user) ;
  }
//TODO acer que los repositorios se basen en una interface
  @override
  Future<bool> deleteUser(User user) async {
    return dataSource.deleteUser(user.id);
  }

  @override
  Future<User?> getUser(String userId) async {
    return dataSource.getUser(userId) ;
  }

  @override
  Future<bool> updateUser(User user) async {
    return dataSource.updateUser(user);
  }
}
