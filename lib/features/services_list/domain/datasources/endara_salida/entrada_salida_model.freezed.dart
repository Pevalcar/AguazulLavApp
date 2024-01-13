// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entrada_salida_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntradaSalida _$EntradaSalidaFromJson(Map<String, dynamic> json) {
  return _Jornada.fromJson(json);
}

/// @nodoc
mixin _$EntradaSalida {
  String get id => throw _privateConstructorUsedError;
  DateTime? get fecha => throw _privateConstructorUsedError;
  bool get entrada => throw _privateConstructorUsedError;
  int get valor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntradaSalidaCopyWith<EntradaSalida> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntradaSalidaCopyWith<$Res> {
  factory $EntradaSalidaCopyWith(
          EntradaSalida value, $Res Function(EntradaSalida) then) =
      _$EntradaSalidaCopyWithImpl<$Res, EntradaSalida>;
  @useResult
  $Res call({String id, DateTime? fecha, bool entrada, int valor});
}

/// @nodoc
class _$EntradaSalidaCopyWithImpl<$Res, $Val extends EntradaSalida>
    implements $EntradaSalidaCopyWith<$Res> {
  _$EntradaSalidaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fecha = freezed,
    Object? entrada = null,
    Object? valor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fecha: freezed == fecha
          ? _value.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as bool,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JornadaImplCopyWith<$Res>
    implements $EntradaSalidaCopyWith<$Res> {
  factory _$$JornadaImplCopyWith(
          _$JornadaImpl value, $Res Function(_$JornadaImpl) then) =
      __$$JornadaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime? fecha, bool entrada, int valor});
}

/// @nodoc
class __$$JornadaImplCopyWithImpl<$Res>
    extends _$EntradaSalidaCopyWithImpl<$Res, _$JornadaImpl>
    implements _$$JornadaImplCopyWith<$Res> {
  __$$JornadaImplCopyWithImpl(
      _$JornadaImpl _value, $Res Function(_$JornadaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fecha = freezed,
    Object? entrada = null,
    Object? valor = null,
  }) {
    return _then(_$JornadaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fecha: freezed == fecha
          ? _value.fecha
          : fecha // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as bool,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JornadaImpl implements _Jornada {
  _$JornadaImpl(
      {this.id = '', this.fecha = null, this.entrada = false, this.valor = 0});

  factory _$JornadaImpl.fromJson(Map<String, dynamic> json) =>
      _$$JornadaImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final DateTime? fecha;
  @override
  @JsonKey()
  final bool entrada;
  @override
  @JsonKey()
  final int valor;

  @override
  String toString() {
    return 'EntradaSalida(id: $id, fecha: $fecha, entrada: $entrada, valor: $valor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JornadaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fecha, fecha) || other.fecha == fecha) &&
            (identical(other.entrada, entrada) || other.entrada == entrada) &&
            (identical(other.valor, valor) || other.valor == valor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fecha, entrada, valor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JornadaImplCopyWith<_$JornadaImpl> get copyWith =>
      __$$JornadaImplCopyWithImpl<_$JornadaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JornadaImplToJson(
      this,
    );
  }
}

abstract class _Jornada implements EntradaSalida {
  factory _Jornada(
      {final String id,
      final DateTime? fecha,
      final bool entrada,
      final int valor}) = _$JornadaImpl;

  factory _Jornada.fromJson(Map<String, dynamic> json) = _$JornadaImpl.fromJson;

  @override
  String get id;
  @override
  DateTime? get fecha;
  @override
  bool get entrada;
  @override
  int get valor;
  @override
  @JsonKey(ignore: true)
  _$$JornadaImplCopyWith<_$JornadaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
