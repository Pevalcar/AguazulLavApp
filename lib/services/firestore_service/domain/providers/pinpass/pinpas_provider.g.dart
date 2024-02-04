// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinpas_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pinpassDataSourceHash() => r'aa925cc765423ae0babc516cf990ebf50051ec93';

/// See also [pinpassDataSource].
@ProviderFor(pinpassDataSource)
final pinpassDataSourceProvider =
    AutoDisposeProvider<PinPasDataSource>.internal(
  pinpassDataSource,
  name: r'pinpassDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinpassDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinpassDataSourceRef = AutoDisposeProviderRef<PinPasDataSource>;
String _$pinpassRepositoryHash() => r'0a4ee253c7c6375671892342fd9146d14770d715';

/// See also [pinpassRepository].
@ProviderFor(pinpassRepository)
final pinpassRepositoryProvider =
    AutoDisposeProvider<PinPassRepository>.internal(
  pinpassRepository,
  name: r'pinpassRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinpassRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinpassRepositoryRef = AutoDisposeProviderRef<PinPassRepository>;
String _$pinpassGetHash() => r'763666d0c01e910152d41cacbdab6ccdeef14538';

/// See also [pinpassGet].
@ProviderFor(pinpassGet)
final pinpassGetProvider = AutoDisposeProvider<PinPassGet>.internal(
  pinpassGet,
  name: r'pinpassGetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinpassGetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinpassGetRef = AutoDisposeProviderRef<PinPassGet>;
String _$pinpassUpdateHash() => r'c97202eedff7a8ed90942a5ae371055ab4b7e1e1';

/// See also [pinpassUpdate].
@ProviderFor(pinpassUpdate)
final pinpassUpdateProvider = AutoDisposeProvider<PinPassUpdate>.internal(
  pinpassUpdate,
  name: r'pinpassUpdateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pinpassUpdateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinpassUpdateRef = AutoDisposeProviderRef<PinPassUpdate>;
String _$pinPassHash() => r'93861a334d9cead2d3a13c6f6c4c0f3314b359fa';

/// See also [PinPass].
@ProviderFor(PinPass)
final pinPassProvider =
    AutoDisposeAsyncNotifierProvider<PinPass, int?>.internal(
  PinPass.new,
  name: r'pinPassProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinPassHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PinPass = AutoDisposeAsyncNotifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
