// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jornada_info_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$jornadaInfoHash() => r'cbfe99791048f51ef7e768bb98a220632d7b584b';

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

abstract class _$JornadaInfo
    extends BuildlessAutoDisposeAsyncNotifier<JornadaInfoModel?> {
  late final Jornada? jornada;

  FutureOr<JornadaInfoModel?> build(
    Jornada? jornada,
  );
}

/// See also [JornadaInfo].
@ProviderFor(JornadaInfo)
const jornadaInfoProvider = JornadaInfoFamily();

/// See also [JornadaInfo].
class JornadaInfoFamily extends Family<AsyncValue<JornadaInfoModel?>> {
  /// See also [JornadaInfo].
  const JornadaInfoFamily();

  /// See also [JornadaInfo].
  JornadaInfoProvider call(
    Jornada? jornada,
  ) {
    return JornadaInfoProvider(
      jornada,
    );
  }

  @override
  JornadaInfoProvider getProviderOverride(
    covariant JornadaInfoProvider provider,
  ) {
    return call(
      provider.jornada,
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
  String? get name => r'jornadaInfoProvider';
}

/// See also [JornadaInfo].
class JornadaInfoProvider extends AutoDisposeAsyncNotifierProviderImpl<
    JornadaInfo, JornadaInfoModel?> {
  /// See also [JornadaInfo].
  JornadaInfoProvider(
    Jornada? jornada,
  ) : this._internal(
          () => JornadaInfo()..jornada = jornada,
          from: jornadaInfoProvider,
          name: r'jornadaInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$jornadaInfoHash,
          dependencies: JornadaInfoFamily._dependencies,
          allTransitiveDependencies:
              JornadaInfoFamily._allTransitiveDependencies,
          jornada: jornada,
        );

  JornadaInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jornada,
  }) : super.internal();

  final Jornada? jornada;

  @override
  FutureOr<JornadaInfoModel?> runNotifierBuild(
    covariant JornadaInfo notifier,
  ) {
    return notifier.build(
      jornada,
    );
  }

  @override
  Override overrideWith(JornadaInfo Function() create) {
    return ProviderOverride(
      origin: this,
      override: JornadaInfoProvider._internal(
        () => create()..jornada = jornada,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jornada: jornada,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<JornadaInfo, JornadaInfoModel?>
      createElement() {
    return _JornadaInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is JornadaInfoProvider && other.jornada == jornada;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jornada.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin JornadaInfoRef on AutoDisposeAsyncNotifierProviderRef<JornadaInfoModel?> {
  /// The parameter `jornada` of this provider.
  Jornada? get jornada;
}

class _JornadaInfoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<JornadaInfo,
        JornadaInfoModel?> with JornadaInfoRef {
  _JornadaInfoProviderElement(super.provider);

  @override
  Jornada? get jornada => (origin as JornadaInfoProvider).jornada;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
