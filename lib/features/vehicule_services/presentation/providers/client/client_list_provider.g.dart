// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataSourceHash() => r'79a3403bc08971746047e8eab8b18a8f856aa50e';

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
String _$deleteUserHash() => r'9a5637a58a93e8442b44bc3db84ea506852893f4';

/// See also [deleteUser].
@ProviderFor(deleteUser)
final deleteUserProvider = AutoDisposeProvider<DeleteClient>.internal(
  deleteUser,
  name: r'deleteUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deleteUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteUserRef = AutoDisposeProviderRef<DeleteClient>;
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
String _$getUserInfoHash() => r'46bb05d360c4b0e49aa31ec6b943f1524307325a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [GetUserInfo].
@ProviderFor(GetUserInfo)
const getUserInfoProvider = GetUserInfoFamily();

/// See also [GetUserInfo].
class GetUserInfoFamily extends Family<AsyncValue<Client?>> {
  /// See also [GetUserInfo].
  const GetUserInfoFamily();

  /// See also [GetUserInfo].
  GetUserInfoProvider call(
    String userID,
  ) {
    return GetUserInfoProvider(
      userID,
    );
  }

  @override
  GetUserInfoProvider getProviderOverride(
    covariant GetUserInfoProvider provider,
  ) {
    return call(
      provider.userID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserInfoProvider';
}

/// See also [GetUserInfo].
class GetUserInfoProvider extends AutoDisposeFutureProvider<Client?> {
  /// See also [GetUserInfo].
  GetUserInfoProvider(
    String userID,
  ) : this._internal(
          (ref) => GetUserInfo(
            ref as GetUserInfoRef,
            userID,
          ),
          from: getUserInfoProvider,
          name: r'getUserInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserInfoHash,
          dependencies: GetUserInfoFamily._dependencies,
          allTransitiveDependencies:
              GetUserInfoFamily._allTransitiveDependencies,
          userID: userID,
        );

  GetUserInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userID,
  }) : super.internal();

  final String userID;

  @override
  Override overrideWith(
    FutureOr<Client?> Function(GetUserInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserInfoProvider._internal(
        (ref) => create(ref as GetUserInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userID: userID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Client?> createElement() {
    return _GetUserInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserInfoProvider && other.userID == userID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserInfoRef on AutoDisposeFutureProviderRef<Client?> {
  /// The parameter `userID` of this provider.
  String get userID;
}

class _GetUserInfoProviderElement
    extends AutoDisposeFutureProviderElement<Client?> with GetUserInfoRef {
  _GetUserInfoProviderElement(super.provider);

  @override
  String get userID => (origin as GetUserInfoProvider).userID;
}

String _$clientListHash() => r'6d5c61ab5277c4d722c6e4e5c2975bdceb3c7fd6';

/// See also [ClientList].
@ProviderFor(ClientList)
final clientListProvider =
    AsyncNotifierProvider<ClientList, List<Client>>.internal(
  ClientList.new,
  name: r'clientListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$clientListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClientList = AsyncNotifier<List<Client>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
