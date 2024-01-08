import 'package:aguazullavapp/features/vehicule_services/data/repositories/user_data_repository_impl.dart';
import 'package:aguazullavapp/features/vehicule_services/domain/repositories/user_data_repository.dart';
import 'package:aguazullavapp/features/vehicule_services/domain/usecases/client/add_user.dart';
import 'package:aguazullavapp/features/vehicule_services/domain/usecases/client/delete_user.dart';
import 'package:aguazullavapp/features/vehicule_services/domain/usecases/client/get_user.dart';
import 'package:aguazullavapp/features/vehicule_services/domain/usecases/client/get_users.dart';
import 'package:aguazullavapp/features/vehicule_services/domain/usecases/client/modifie_user.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasources/user_dataSource.dart';

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

@riverpod
class ClientList extends _$ClientList {
  Future<List<User>> _fetch() async {
    final list = await ref.watch(getUsersProvider).call();
    return list;
  }

  @override
  Future<List<User>> build() {
    return _fetch();
  }

  void addUSer(User user, Function(User)? onAddClient) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final _userGuard = await ref.watch(addUserProvider).call(user);
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
      bool _userModifie = await ref.watch(modifieUserProvider).call(user);
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
      bool _userModifie = await ref.watch(modifieUserProvider).call(user);
      if (_userModifie) {
        state.asData?.value.removeWhere((element) => element.id == user.id);
        return state.asData?.value ?? [];
      }
      return state.asData?.value ?? [];
    });
  }

  Future<User?> getUser(String userID) async {
    if (userID == "") return null;
    //si la base de taos local l contiene
    if (state.asData?.value != null) {
      return state.asData?.value.firstWhere((element) => element.id == userID);
    }
    return await ref.watch(getUserProvider).call(userID);
  }
}
