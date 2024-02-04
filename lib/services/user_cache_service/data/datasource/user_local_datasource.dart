import 'dart:convert';

import 'package:aguazullavapp/lib.dart';

abstract class UserCaheDataSource {
  String get storageKey;

  Future<UserInformationModel?> fetchUser();
  Future<bool> saveUser({required UserInformationModel user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}

class UserLocalDatasource extends UserCaheDataSource {
  UserLocalDatasource(this.storageService);

  final SharedPrefsService storageService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<UserInformationModel?> fetchUser() async {
    final data = await storageService.get(storageKey);
    if (data == null) {
      return null;
    }
    final  userJson = jsonDecode(data.toString());

    return UserInformationModel.fromJson(userJson);
  }

  @override
  Future<bool> saveUser({required UserInformationModel user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }
}
