// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataSourceHash() => r'ea471fc45539ef6c0bdfa6f65af681c95a589fe7';

/// See also [userDataSource].
@ProviderFor(userDataSource)
final userDataSourceProvider = AutoDisposeProvider<UserDataSource>.internal(
  userDataSource,
  name: r'userDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDataSourceRef = AutoDisposeProviderRef<UserDataSource>;
String _$userDataRepositoryIMPLHash() =>
    r'ef657469dd51a0eea7a06dd3479674ba6588d0ab';

/// See also [userDataRepositoryIMPL].
@ProviderFor(userDataRepositoryIMPL)
final userDataRepositoryIMPLProvider =
    AutoDisposeProvider<UserDataRepository>.internal(
  userDataRepositoryIMPL,
  name: r'userDataRepositoryIMPLProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userDataRepositoryIMPLHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDataRepositoryIMPLRef = AutoDisposeProviderRef<UserDataRepository>;
String _$addUserHash() => r'ed4e70e29e80796ab50bdca32e21d65d326ed333';

/// See also [addUser].
@ProviderFor(addUser)
final addUserProvider = AutoDisposeProvider<AddUser>.internal(
  addUser,
  name: r'addUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddUserRef = AutoDisposeProviderRef<AddUser>;
String _$deleteUserHash() => r'b9222fe925a7797479cb3e21c2e6cd851df715a8';

/// See also [deleteUser].
@ProviderFor(deleteUser)
final deleteUserProvider = AutoDisposeProvider<DeleteUser>.internal(
  deleteUser,
  name: r'deleteUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deleteUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteUserRef = AutoDisposeProviderRef<DeleteUser>;
String _$modifieUserHash() => r'e1616ce98542ff55534c8fc7fdb247eb0c0d02e9';

/// See also [modifieUser].
@ProviderFor(modifieUser)
final modifieUserProvider = AutoDisposeProvider<ModifieUser>.internal(
  modifieUser,
  name: r'modifieUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$modifieUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ModifieUserRef = AutoDisposeProviderRef<ModifieUser>;
String _$getUserHash() => r'38b27b70d7625e54dbff419151869cecea37c592';

/// See also [getUser].
@ProviderFor(getUser)
final getUserProvider = AutoDisposeProvider<GetUser>.internal(
  getUser,
  name: r'getUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserRef = AutoDisposeProviderRef<GetUser>;
String _$getUsersHash() => r'977d6d0989c39fc889f06ff5b61131590bae6efa';

/// See also [getUsers].
@ProviderFor(getUsers)
final getUsersProvider = AutoDisposeProvider<GetUsers>.internal(
  getUsers,
  name: r'getUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUsersRef = AutoDisposeProviderRef<GetUsers>;
String _$clientListHash() => r'e1c081498f14e22ca45e70edfeaf85ffe21ef299';

/// See also [ClientList].
@ProviderFor(ClientList)
final clientListProvider =
    AutoDisposeAsyncNotifierProvider<ClientList, List<User>>.internal(
  ClientList.new,
  name: r'clientListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClientList = AutoDisposeAsyncNotifier<List<User>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
