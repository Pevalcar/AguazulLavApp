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

@Riverpod(keepAlive: true)
class ClientList extends _$ClientList {
  Future<List<Client>> _fetch() async {
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
    return _fetch();
  }

  void addUSer(Client user, Function(Client)? onAddClient) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final userGuard = await ref.read(addUserProvider).call(user);
      List<Client> newList = state.value ?? [];
      if (userGuard != null) {
        onAddClient == null ? null : onAddClient(userGuard);
        state.value?.add(userGuard);
      }
      return newList;
    });
  }

  void modifieUSer(Client user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      bool userModifie = await ref.read(modifieUserProvider).call(user);
      //TODO reformatear par evitar errores con el list.from
      if (userModifie) {
        state.asData?.value.removeWhere((element) => element.id == user.id);
        state.asData?.value.add(user);
        return state.asData?.value ?? [];
      }
      return state.asData?.value ?? [];
    });
  }

  void deleteUSer(Client user) async {
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
  Future<Client?> getUSer(String id) async {
    return state.asData?.value.firstWhere((element) => element.id == id) ?? await ref.read(getUserProvider).call(id);
  }

}

@riverpod
Future<Client?> GetUserInfo(GetUserInfoRef ref, String userID) async {
  if (userID.isEmpty) return null;
  if (userID == "1234") return null;
  Client? user = await ref.read(clientListProvider.notifier). getUSer(userID);
  return user;
}
