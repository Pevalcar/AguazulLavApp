// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTimeHash() => r'56ee1f912cd5be56ba718151fe37dcea24193361';

/// See also [CurrentTime].
@ProviderFor(CurrentTime)
final currentTimeProvider = AutoDisposeProvider<String>.internal(
  CurrentTime,
  name: r'currentTimeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentTimeRef = AutoDisposeProviderRef<String>;
String _$vehiculoStateHash() => r'862d76f2e9a2f74f461387d9f6525050a2bd50c2';

/// See also [VehiculoState].
@ProviderFor(VehiculoState)
final vehiculoStateProvider =
    AsyncNotifierProvider<VehiculoState, Vehicle>.internal(
  VehiculoState.new,
  name: r'vehiculoStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiculoStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehiculoState = AsyncNotifier<Vehicle>;
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
String _$keyFromAddServiceHash() => r'f70025133659c6936f4960100401456d0ec0fbb9';

/// See also [KeyFromAddService].
@ProviderFor(KeyFromAddService)
final keyFromAddServiceProvider = AutoDisposeNotifierProvider<KeyFromAddService,
    GlobalKey<FormState>>.internal(
  KeyFromAddService.new,
  name: r'keyFromAddServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$keyFromAddServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KeyFromAddService = AutoDisposeNotifier<GlobalKey<FormState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
