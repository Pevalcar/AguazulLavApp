// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_service_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listServiceHash() => r'3eee232b4d792ca4856e28c8204a2f383be52031';

/// See also [ListService].
@ProviderFor(ListService)
final listServiceProvider = AutoDisposeProvider<List<ServiceInfo>>.internal(
  ListService,
  name: r'listServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListServiceRef = AutoDisposeProviderRef<List<ServiceInfo>>;
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
String _$serviceSelectHash() => r'562e3aef19fedae5ffd0fa2682c80346b9f3342b';

/// See also [ServiceSelect].
@ProviderFor(ServiceSelect)
final serviceSelectProvider =
    AutoDisposeNotifierProvider<ServiceSelect, ServiceInfo?>.internal(
  ServiceSelect.new,
  name: r'serviceSelectProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serviceSelectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ServiceSelect = AutoDisposeNotifier<ServiceInfo?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
