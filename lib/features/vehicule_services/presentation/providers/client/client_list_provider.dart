// ignore_for_file: non_constant_identifier_names

import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "client_list_provider.g.dart";

@riverpod
UserDataSource userDataSource(UserDataSourceRef ref) {
  final firestore = FirebaseFirestore.instance.collection("ClientesDB");
  return UserDataSource(firestore: firestore);
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
DeleteClient deleteUser(DeleteUserRef ref) {
  final repository = ref.watch(userDataRepositoryIMPLProvider);
  return DeleteClient(repository: repository);
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

//TODO conectar con la base de datos en el dispositivo recargable apartir de un botor de loading
@Riverpod(keepAlive: true)
class ClientList extends _$ClientList {
  Future<List<Client>> fetch() async {
    List<Client> list = [];
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      list = await ref.read(getUsersProvider).call();
      return list;
    });
    return list;
  }

  @override
  Future<List<Client>> build() {
    return fetch();
  }

  void addClient(Client user, Function(Client)? onAddClient) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userGuard = await ref.read(addUserProvider).call(user);
      List<Client> newList = List.from(state.value ?? []);
      if (userGuard != null) {
        onAddClient == null ? null : onAddClient(userGuard);
        newList.add(userGuard);
      }
      return newList;
    });
  }

  void modifieUSer(Client user, Function()? onEditComplete) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      bool userModified = await ref.read(modifieUserProvider).call(user);
      List<Client> newList = List.from(state.value ?? []);
      if (userModified) {
        newList.removeWhere((element) => element.id == user.id);
        newList.add(user);
        onEditComplete == null ? null : onEditComplete();
      }
      return newList;
    });
  }

  Future<void> updateBonus(String id) async {
    Client? user = await ref.read(getUserProvider).call(id);
    if (user != null) {
      user = user.copyWith(bonus: user.bonus + 1);
      modifieUSer(user, null);
    }
  }

  void deleteUSer(Client user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      bool userModified = await ref.read(deleteUserProvider).call(user);
      List<Client> newList = List.from(state.value ?? []);
      if (userModified) {
        newList.removeWhere((element) => element.id == user.id);
      }
      return newList;
    });
  }

  Future<Client?> getUser(String id) async {
    return state.asData?.value.firstWhere((element) => element.id == id) ??
        await ref.read(getUserProvider).call(id);
  }
}

@riverpod
Future<Client?> GetUserInfo(GetUserInfoRef ref, String userID) async {
  if (userID.isEmpty) return null;

  if (userID.length < 15) {
    return Client(
        name: userID,
        id: userID,
        bonus: 0,
        identification: userID,
        phone: userID);
  }
  Client? user = await ref.read(clientListProvider.notifier).getUser(userID);

  return user;
}
