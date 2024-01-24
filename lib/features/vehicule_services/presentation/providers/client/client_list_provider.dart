import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "client_list_provider.g.dart";

@riverpod
UserDataSource userDataSource(UserDataSourceRef ref) {
  final _firestore = FirebaseFirestore.instance.collection("ClientesDB");
  return UserDataSource(firestore: _firestore);
}

@riverpod
UserDataRepository userDataRepositoryIMPL(UserDataRepositoryIMPLRef ref) {
  final userDataSource = ref.watch(userDataSourceProvider);
  return UserDataRepositoryImpl(dataSource: userDataSource);
}

@riverpod
AddUser addUser(AddUserRef ref) {
  final repository = ref.watch(userDataRepositoryIMPLProvider);
  return AddUser(repository: repository);
}

@riverpod
DeleteUser deleteUser(DeleteUserRef ref) {
  final repository = ref.watch(userDataRepositoryIMPLProvider);
  return DeleteUser(repository: repository);
}

@riverpod
ModifieUser modifieUser(ModifieUserRef ref) {
  final repository = ref.watch(userDataRepositoryIMPLProvider);
  return ModifieUser(repository: repository);
}

@riverpod
GetUser getUser(GetUserRef ref) {
  final repository = ref.watch(userDataRepositoryIMPLProvider);
  return GetUser(repository: repository);
}

@riverpod
GetUsers getUsers(GetUsersRef ref) {
  final repository = ref.watch(userDataRepositoryIMPLProvider);
  return GetUsers(repository: repository);
}

@Riverpod(keepAlive: true)
class ClientList extends _$ClientList {
  Future<List<User>> _fetch() async {
    List<User> list = [];
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      list = await ref.read(getUsersProvider).call();
      return list;
    });
    return list;
  }

  @override
  Future<List<User>> build() {
    return _fetch();
  }

  void addUSer(User user, Function(User)? onAddClient) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final _userGuard = await ref.read(addUserProvider).call(user);
      List<User> newList = state.value ?? [];
      if (_userGuard != null) {
        onAddClient == null ? null : onAddClient(_userGuard);
        state.value?.add(_userGuard);
      }
      return newList;
    });
  }

  void modifieUSer(User user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      bool _userModifie = await ref.read(modifieUserProvider).call(user);
      if (_userModifie) {
        state.asData?.value.removeWhere((element) => element.id == user.id);
        state.asData?.value.add(user);
        return state.asData?.value ?? [];
      }
      return state.asData?.value ?? [];
    });
  }

  void deleteUSer(User user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      bool userModifie = await ref.read(modifieUserProvider).call(user);
      if (userModifie) {
        state.asData?.value.removeWhere((element) => element.id == user.id);
        return state.asData?.value ?? [];
      }
      return state.asData?.value ?? [];
    });
  }
  Future<User?> getUSer(String id) async {
    return state.asData?.value.firstWhere((element) => element.id == id) ?? await ref.read(getUserProvider).call(id);
  }

}

@riverpod
Future<User?> GetUserInfo(GetUserInfoRef ref, String userID) async {
  if (userID.isEmpty) return null;
  if (userID == "1234") return null;
  User? user = await ref.read(clientListProvider.notifier). getUSer(userID);
  return user;
}
