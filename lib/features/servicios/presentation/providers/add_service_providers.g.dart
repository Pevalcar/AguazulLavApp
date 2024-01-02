// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehiculoStateHash() => r'46bff804e8a1bb7eec5b91a5c2f08cc3a6f0b125';

/// See also [VehiculoState].
@ProviderFor(VehiculoState)
final vehiculoStateProvider =
    AutoDisposeAsyncNotifierProvider<VehiculoState, Vehicle>.internal(
  VehiculoState.new,
  name: r'vehiculoStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiculoStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehiculoState = AutoDisposeAsyncNotifier<Vehicle>;
String _$placaHash() => r'f84eaaed1b7c8d30a573ac8d1d1d4a7d5e350c25';

/// See also [Placa].
@ProviderFor(Placa)
final placaProvider = AutoDisposeNotifierProvider<Placa, String>.internal(
  Placa.new,
  name: r'placaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$placaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Placa = AutoDisposeNotifier<String>;
String _$propietarioHash() => r'bb02799c82bda4c9a292f28e1ccd8dc937adedc5';

/// See also [Propietario].
@ProviderFor(Propietario)
final propietarioProvider =
    AutoDisposeNotifierProvider<Propietario, User>.internal(
  Propietario.new,
  name: r'propietarioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$propietarioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Propietario = AutoDisposeNotifier<User>;
String _$typoDeVehiculoHash() => r'8b5802deb4581c8eaa64304af6ef894cc43723b6';

/// See also [TypoDeVehiculo].
@ProviderFor(TypoDeVehiculo)
final typoDeVehiculoProvider =
    AutoDisposeNotifierProvider<TypoDeVehiculo, String>.internal(
  TypoDeVehiculo.new,
  name: r'typoDeVehiculoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$typoDeVehiculoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TypoDeVehiculo = AutoDisposeNotifier<String>;
String _$isLoadingHash() => r'c455bc001c1255e8b4bdd58b41cf651a75ca4967';

/// See also [IsLoading].
@ProviderFor(IsLoading)
final isLoadingProvider = AutoDisposeNotifierProvider<IsLoading, bool>.internal(
  IsLoading.new,
  name: r'isLoadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsLoading = AutoDisposeNotifier<bool>;
String _$listPropietariosHash() => r'4d042ea33210b9262df4fb8798d57c7bc3001e0d';

/// See also [ListPropietarios].
@ProviderFor(ListPropietarios)
final listPropietariosProvider =
    AutoDisposeNotifierProvider<ListPropietarios, List<User>>.internal(
  ListPropietarios.new,
  name: r'listPropietariosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listPropietariosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListPropietarios = AutoDisposeNotifier<List<User>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
