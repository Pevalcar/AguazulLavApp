import 'package:aguazullavapp/lib.dart';

abstract class UserDataRepository {
  Future<List<User>> getUsers();
  Future<User?> addUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(User user);
  Future<User?> getUser(String userId);
}
