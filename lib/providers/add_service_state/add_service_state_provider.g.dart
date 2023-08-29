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
String _$vehiculoStateHash() => r'a4dac63639e0acf5aeee922b51eb6cdb268d27a7';

/// See also [VehiculoState].
@ProviderFor(VehiculoState)
final vehiculoStateProvider = NotifierProvider<VehiculoState, Vehicle>.internal(
  VehiculoState.new,
  name: r'vehiculoStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiculoStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehiculoState = Notifier<Vehicle>;
String _$errorStateHash() => r'ef581c7e6c2bcef6652aa429e6b5d0d230b115ef';

/// See also [ErrorState].
@ProviderFor(ErrorState)
final errorStateProvider =
    AutoDisposeNotifierProvider<ErrorState, String>.internal(
  ErrorState.new,
  name: r'errorStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$errorStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ErrorState = AutoDisposeNotifier<String>;
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
