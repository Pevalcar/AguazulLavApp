import 'package:aguazullavapp/lib.dart';
abstract class IUserCacheRepository {
  Future<UserInformationModel?> fetchUser();
  Future<bool> saveUser({required UserInformationModel user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
