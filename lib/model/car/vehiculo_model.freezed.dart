// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehiculo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vehiculo _$VehiculoFromJson(Map<String, dynamic> json) {
  return _Vehiculo.fromJson(json);
}

/// @nodoc
mixin _$Vehiculo {
  String get id => throw _privateConstructorUsedError;

  String get photo => throw _privateConstructorUsedError;

  String get placa => throw _privateConstructorUsedError;

  VeiculoType get type => throw _privateConstructorUsedError;

  User get propietario => throw _privateConstructorUsedError;

  String get entrada => throw _privateConstructorUsedError;

  String get salida => throw _privateConstructorUsedError;

  Servicio get servicios => throw _privateConstructorUsedError;

  bool get terminado => throw _privateConstructorUsedError;

  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VehiculoCopyWith<Vehiculo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehiculoCopyWith<$Res> {
  factory $VehiculoCopyWith(Vehiculo value, $Res Function(Vehiculo) then) =
      _$VehiculoCopyWithImpl<$Res, Vehiculo>;

  @useResult
  $Res call(
      {String id,
      String photo,
      String placa,
      VeiculoType type,
      User propietario,
      String entrada,
      String salida,
      Servicio servicios,
      bool terminado,
      String price});

  $UserCopyWith<$Res> get propietario;
}

/// @nodoc
class _$VehiculoCopyWithImpl<$Res, $Val extends Vehiculo>
    implements $VehiculoCopyWith<$Res> {
  _$VehiculoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photo = null,
    Object? placa = null,
    Object? type = null,
    Object? propietario = null,
    Object? entrada = null,
    Object? salida = null,
    Object? servicios = null,
    Object? terminado = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      placa: null == placa
          ? _value.placa
          : placa // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VeiculoType,
      propietario: null == propietario
          ? _value.propietario
          : propietario // ignore: cast_nullable_to_non_nullable
              as User,
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as String,
      salida: null == salida
          ? _value.salida
          : salida // ignore: cast_nullable_to_non_nullable
              as String,
      servicios: null == servicios
          ? _value.servicios
          : servicios // ignore: cast_nullable_to_non_nullable
              as Servicio,
      terminado: null == terminado
          ? _value.terminado
          : terminado // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get propietario {
    return $UserCopyWith<$Res>(_value.propietario, (value) {
      return _then(_value.copyWith(propietario: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehiculoCopyWith<$Res> implements $VehiculoCopyWith<$Res> {
  factory _$$_VehiculoCopyWith(
          _$_Vehiculo value, $Res Function(_$_Vehiculo) then) =
      __$$_VehiculoCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String id,
      String photo,
      String placa,
      VeiculoType type,
      User propietario,
      String entrada,
      String salida,
      Servicio servicios,
      bool terminado,
      String price});

  @override
  $UserCopyWith<$Res> get propietario;
}

/// @nodoc
class __$$_VehiculoCopyWithImpl<$Res>
    extends _$VehiculoCopyWithImpl<$Res, _$_Vehiculo>
    implements _$$_VehiculoCopyWith<$Res> {
  __$$_VehiculoCopyWithImpl(
      _$_Vehiculo _value, $Res Function(_$_Vehiculo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photo = null,
    Object? placa = null,
    Object? type = null,
    Object? propietario = null,
    Object? entrada = null,
    Object? salida = null,
    Object? servicios = null,
    Object? terminado = null,
    Object? price = null,
  }) {
    return _then(_$_Vehiculo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      placa: null == placa
          ? _value.placa
          : placa // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VeiculoType,
      propietario: null == propietario
          ? _value.propietario
          : propietario // ignore: cast_nullable_to_non_nullable
              as User,
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as String,
      salida: null == salida
          ? _value.salida
          : salida // ignore: cast_nullable_to_non_nullable
              as String,
      servicios: null == servicios
          ? _value.servicios
          : servicios // ignore: cast_nullable_to_non_nullable
              as Servicio,
      terminado: null == terminado
          ? _value.terminado
          : terminado // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vehiculo with DiagnosticableTreeMixin implements _Vehiculo {
  const _$_Vehiculo(
      {this.id = "",
      this.photo = "",
      this.placa = "",
      this.type = VeiculoType.AutoMovil,
      this.propietario = const User(id: "", name: "", phone: ""),
      this.entrada = "",
      this.salida = "",
      this.servicios = Servicio.Basico,
      this.terminado = false,
      this.price = "0"});

  factory _$_Vehiculo.fromJson(Map<String, dynamic> json) =>
      _$$_VehiculoFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String photo;
  @override
  @JsonKey()
  final String placa;
  @override
  @JsonKey()
  final VeiculoType type;
  @override
  @JsonKey()
  final User propietario;
  @override
  @JsonKey()
  final String entrada;
  @override
  @JsonKey()
  final String salida;
  @override
  @JsonKey()
  final Servicio servicios;
  @override
  @JsonKey()
  final bool terminado;
  @override
  @JsonKey()
  final String price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vehiculo(id: $id, photo: $photo, placa: $placa, type: $type, propietario: $propietario, entrada: $entrada, salida: $salida, servicios: $servicios, terminado: $terminado, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vehiculo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('placa', placa))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('propietario', propietario))
      ..add(DiagnosticsProperty('entrada', entrada))
      ..add(DiagnosticsProperty('salida', salida))
      ..add(DiagnosticsProperty('servicios', servicios))
      ..add(DiagnosticsProperty('terminado', terminado))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Vehiculo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.placa, placa) || other.placa == placa) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.propietario, propietario) ||
                other.propietario == propietario) &&
            (identical(other.entrada, entrada) || other.entrada == entrada) &&
            (identical(other.salida, salida) || other.salida == salida) &&
            (identical(other.servicios, servicios) ||
                other.servicios == servicios) &&
            (identical(other.terminado, terminado) ||
                other.terminado == terminado) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, photo, placa, type,
      propietario, entrada, salida, servicios, terminado, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehiculoCopyWith<_$_Vehiculo> get copyWith =>
      __$$_VehiculoCopyWithImpl<_$_Vehiculo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehiculoToJson(
      this,
    );
  }
}

abstract class _Vehiculo implements Vehiculo {
  const factory _Vehiculo(
      {final String id,
      final String photo,
      final String placa,
      final VeiculoType type,
      final User propietario,
      final String entrada,
      final String salida,
      final Servicio servicios,
      final bool terminado,
      final String price}) = _$_Vehiculo;

  factory _Vehiculo.fromJson(Map<String, dynamic> json) = _$_Vehiculo.fromJson;

  @override
  String get id;

  @override
  String get photo;

  @override
  String get placa;

  @override
  VeiculoType get type;

  @override
  User get propietario;

  @override
  String get entrada;

  @override
  String get salida;

  @override
  Servicio get servicios;

  @override
  bool get terminado;

  @override
  String get price;

  @override
  @JsonKey(ignore: true)
  _$$_VehiculoCopyWith<_$_Vehiculo> get copyWith =>
      throw _privateConstructorUsedError;
}
