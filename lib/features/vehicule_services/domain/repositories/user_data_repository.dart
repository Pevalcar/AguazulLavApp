import 'package:aguazullavapp/lib.dart';

abstract class UserDataRepository {
  Future<List<Client>> getUsers();
  Future<Client?> addUser(Client user);
  Future<bool> updateUser(Client user);
  Future<bool> deleteUser(Client user);
  Future<Client?> getUser(String userId);
}
