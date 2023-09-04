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
String _$vehiculoStateHash() => r'bb10d1fb17a0326ef8380099b8e1c3705babfd2c';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
