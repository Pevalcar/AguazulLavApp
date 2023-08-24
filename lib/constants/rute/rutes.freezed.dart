// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rutes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Rutas {
  String get route => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String route) Principal,
    required TResult Function(String route) AddService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String route)? Principal,
    TResult? Function(String route)? AddService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String route)? Principal,
    TResult Function(String route)? AddService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Principal value) Principal,
    required TResult Function(_AddService value) AddService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Principal value)? Principal,
    TResult? Function(_AddService value)? AddService,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Principal value)? Principal,
    TResult Function(_AddService value)? AddService,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RutasCopyWith<Rutas> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RutasCopyWith<$Res> {
  factory $RutasCopyWith(Rutas value, $Res Function(Rutas) then) =
      _$RutasCopyWithImpl<$Res, Rutas>;
  @useResult
  $Res call({String route});
}

/// @nodoc
class _$RutasCopyWithImpl<$Res, $Val extends Rutas>
    implements $RutasCopyWith<$Res> {
  _$RutasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrincipalCopyWith<$Res> implements $RutasCopyWith<$Res> {
  factory _$$_PrincipalCopyWith(
          _$_Principal value, $Res Function(_$_Principal) then) =
      __$$_PrincipalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route});
}

/// @nodoc
class __$$_PrincipalCopyWithImpl<$Res>
    extends _$RutasCopyWithImpl<$Res, _$_Principal>
    implements _$$_PrincipalCopyWith<$Res> {
  __$$_PrincipalCopyWithImpl(
      _$_Principal _value, $Res Function(_$_Principal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$_Principal(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Principal implements _Principal {
  const _$_Principal({this.route = "/"});

  @override
  @JsonKey()
  final String route;

  @override
  String toString() {
    return 'Rutas.Principal(route: $route)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Principal &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrincipalCopyWith<_$_Principal> get copyWith =>
      __$$_PrincipalCopyWithImpl<_$_Principal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String route) Principal,
    required TResult Function(String route) AddService,
  }) {
    return Principal(route);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String route)? Principal,
    TResult? Function(String route)? AddService,
  }) {
    return Principal?.call(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String route)? Principal,
    TResult Function(String route)? AddService,
    required TResult orElse(),
  }) {
    if (Principal != null) {
      return Principal(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Principal value) Principal,
    required TResult Function(_AddService value) AddService,
  }) {
    return Principal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Principal value)? Principal,
    TResult? Function(_AddService value)? AddService,
  }) {
    return Principal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Principal value)? Principal,
    TResult Function(_AddService value)? AddService,
    required TResult orElse(),
  }) {
    if (Principal != null) {
      return Principal(this);
    }
    return orElse();
  }
}

abstract class _Principal implements Rutas {
  const factory _Principal({final String route}) = _$_Principal;

  @override
  String get route;
  @override
  @JsonKey(ignore: true)
  _$$_PrincipalCopyWith<_$_Principal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddServiceCopyWith<$Res> implements $RutasCopyWith<$Res> {
  factory _$$_AddServiceCopyWith(
          _$_AddService value, $Res Function(_$_AddService) then) =
      __$$_AddServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String route});
}

/// @nodoc
class __$$_AddServiceCopyWithImpl<$Res>
    extends _$RutasCopyWithImpl<$Res, _$_AddService>
    implements _$$_AddServiceCopyWith<$Res> {
  __$$_AddServiceCopyWithImpl(
      _$_AddService _value, $Res Function(_$_AddService) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
  }) {
    return _then(_$_AddService(
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddService implements _AddService {
  const _$_AddService({this.route = "/Ser"});

  @override
  @JsonKey()
  final String route;

  @override
  String toString() {
    return 'Rutas.AddService(route: $route)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddService &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode => Object.hash(runtimeType, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddServiceCopyWith<_$_AddService> get copyWith =>
      __$$_AddServiceCopyWithImpl<_$_AddService>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String route) Principal,
    required TResult Function(String route) AddService,
  }) {
    return AddService(route);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String route)? Principal,
    TResult? Function(String route)? AddService,
  }) {
    return AddService?.call(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String route)? Principal,
    TResult Function(String route)? AddService,
    required TResult orElse(),
  }) {
    if (AddService != null) {
      return AddService(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Principal value) Principal,
    required TResult Function(_AddService value) AddService,
  }) {
    return AddService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Principal value)? Principal,
    TResult? Function(_AddService value)? AddService,
  }) {
    return AddService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Principal value)? Principal,
    TResult Function(_AddService value)? AddService,
    required TResult orElse(),
  }) {
    if (AddService != null) {
      return AddService(this);
    }
    return orElse();
  }
}

abstract class _AddService implements Rutas {
  const factory _AddService({final String route}) = _$_AddService;

  @override
  String get route;
  @override
  @JsonKey(ignore: true)
  _$$_AddServiceCopyWith<_$_AddService> get copyWith =>
      throw _privateConstructorUsedError;
}
