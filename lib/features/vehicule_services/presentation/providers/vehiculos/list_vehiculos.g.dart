// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_vehiculos.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehiculoDataSourceHash() =>
    r'f939edc95839806f02d63d623503433c1dd4bbd3';

/// See also [vehiculoDataSource].
@ProviderFor(vehiculoDataSource)
final vehiculoDataSourceProvider =
    AutoDisposeProvider<VehiculoDataSource>.internal(
  vehiculoDataSource,
  name: r'vehiculoDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiculoDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VehiculoDataSourceRef = AutoDisposeProviderRef<VehiculoDataSource>;
String _$vehiculoRepositoryHash() =>
    r'76450b5e01793c4d1594cc078b4a631e3ae9797e';

/// See also [vehiculoRepository].
@ProviderFor(vehiculoRepository)
final vehiculoRepositoryProvider =
    AutoDisposeProvider<VehiculoRepositoryImpl>.internal(
  vehiculoRepository,
  name: r'vehiculoRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiculoRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VehiculoRepositoryRef = AutoDisposeProviderRef<VehiculoRepositoryImpl>;
String _$getVehiculoHash() => r'a97c4ccceffab7be607ab2699b8e4c39da83da9f';

/// See also [getVehiculo].
@ProviderFor(getVehiculo)
final getVehiculoProvider = AutoDisposeProvider<GetVehiculos>.internal(
  getVehiculo,
  name: r'getVehiculoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getVehiculoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetVehiculoRef = AutoDisposeProviderRef<GetVehiculos>;
String _$serviceListHash() => r'b11442b42e7a555b2562341486c1f3d21a6e058b';

/// See also [ServiceList].
@ProviderFor(ServiceList)
final serviceListProvider =
    AutoDisposeAsyncNotifierProvider<ServiceList, List<Vehicle>>.internal(
  ServiceList.new,
  name: r'serviceListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serviceListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServiceList = AutoDisposeAsyncNotifier<List<Vehicle>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
