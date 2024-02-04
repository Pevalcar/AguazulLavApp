

import 'package:aguazullavapp/lib.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCacheRepositoryImpl extends IUserCacheRepository {
  UserCacheRepositoryImpl(this.dataSource);

  final UserCaheDataSource dataSource;

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser( );
  }

  @override
  Future<UserInformationModel?> fetchUser() {
    return dataSource.fetchUser();
  }

  @override
  Future<bool> saveUser({required  UserInformationModel user}) {
    return dataSource.saveUser(user: user);
  }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }
  
}
