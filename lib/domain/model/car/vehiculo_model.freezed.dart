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

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehiculo.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get id => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get placa => throw _privateConstructorUsedError;
  VeiculoType get type => throw _privateConstructorUsedError;
  User get propietario => throw _privateConstructorUsedError;
  DateTime? get entrada => throw _privateConstructorUsedError;
  DateTime? get salida => throw _privateConstructorUsedError;
  ServiceInfo? get servicios => throw _privateConstructorUsedError;
  bool get terminado => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  bool get onCreate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {String id,
      String photo,
      String placa,
      VeiculoType type,
      User propietario,
      DateTime? entrada,
      DateTime? salida,
      ServiceInfo? servicios,
      bool terminado,
      String price,
      bool onCreate});

  $UserCopyWith<$Res> get propietario;
  $ServiceInfoCopyWith<$Res>? get servicios;
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

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
    Object? entrada = freezed,
    Object? salida = freezed,
    Object? servicios = freezed,
    Object? terminado = null,
    Object? price = null,
    Object? onCreate = null,
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
      entrada: freezed == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      salida: freezed == salida
          ? _value.salida
          : salida // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      servicios: freezed == servicios
          ? _value.servicios
          : servicios // ignore: cast_nullable_to_non_nullable
              as ServiceInfo?,
      terminado: null == terminado
          ? _value.terminado
          : terminado // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      onCreate: null == onCreate
          ? _value.onCreate
          : onCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get propietario {
    return $UserCopyWith<$Res>(_value.propietario, (value) {
      return _then(_value.copyWith(propietario: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceInfoCopyWith<$Res>? get servicios {
    if (_value.servicios == null) {
      return null;
    }

    return $ServiceInfoCopyWith<$Res>(_value.servicios!, (value) {
      return _then(_value.copyWith(servicios: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehiculoImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehiculoImplCopyWith(
          _$VehiculoImpl value, $Res Function(_$VehiculoImpl) then) =
      __$$VehiculoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String photo,
      String placa,
      VeiculoType type,
      User propietario,
      DateTime? entrada,
      DateTime? salida,
      ServiceInfo? servicios,
      bool terminado,
      String price,
      bool onCreate});

  @override
  $UserCopyWith<$Res> get propietario;
  @override
  $ServiceInfoCopyWith<$Res>? get servicios;
}

/// @nodoc
class __$$VehiculoImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehiculoImpl>
    implements _$$VehiculoImplCopyWith<$Res> {
  __$$VehiculoImplCopyWithImpl(
      _$VehiculoImpl _value, $Res Function(_$VehiculoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photo = null,
    Object? placa = null,
    Object? type = null,
    Object? propietario = null,
    Object? entrada = freezed,
    Object? salida = freezed,
    Object? servicios = freezed,
    Object? terminado = null,
    Object? price = null,
    Object? onCreate = null,
  }) {
    return _then(_$VehiculoImpl(
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
      entrada: freezed == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      salida: freezed == salida
          ? _value.salida
          : salida // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      servicios: freezed == servicios
          ? _value.servicios
          : servicios // ignore: cast_nullable_to_non_nullable
              as ServiceInfo?,
      terminado: null == terminado
          ? _value.terminado
          : terminado // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      onCreate: null == onCreate
          ? _value.onCreate
          : onCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehiculoImpl with DiagnosticableTreeMixin implements _Vehiculo {
  _$VehiculoImpl(
      {this.id = "",
      this.photo = "",
      this.placa = "",
      this.type = VeiculoType.autoMovil,
      this.propietario = const User(),
      this.entrada,
      this.salida,
      this.servicios,
      this.terminado = false,
      this.price = "",
      this.onCreate = false});

  factory _$VehiculoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehiculoImplFromJson(json);

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
  final DateTime? entrada;
  @override
  final DateTime? salida;
  @override
  final ServiceInfo? servicios;
  @override
  @JsonKey()
  final bool terminado;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final bool onCreate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vehicle(id: $id, photo: $photo, placa: $placa, type: $type, propietario: $propietario, entrada: $entrada, salida: $salida, servicios: $servicios, terminado: $terminado, price: $price, onCreate: $onCreate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vehicle'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('placa', placa))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('propietario', propietario))
      ..add(DiagnosticsProperty('entrada', entrada))
      ..add(DiagnosticsProperty('salida', salida))
      ..add(DiagnosticsProperty('servicios', servicios))
      ..add(DiagnosticsProperty('terminado', terminado))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('onCreate', onCreate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiculoImpl &&
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
            (identical(other.price, price) || other.price == price) &&
            (identical(other.onCreate, onCreate) ||
                other.onCreate == onCreate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, photo, placa, type,
      propietario, entrada, salida, servicios, terminado, price, onCreate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehiculoImplCopyWith<_$VehiculoImpl> get copyWith =>
      __$$VehiculoImplCopyWithImpl<_$VehiculoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehiculoImplToJson(
      this,
    );
  }
}

abstract class _Vehiculo implements Vehicle {
  factory _Vehiculo(
      {final String id,
      final String photo,
      final String placa,
      final VeiculoType type,
      final User propietario,
      final DateTime? entrada,
      final DateTime? salida,
      final ServiceInfo? servicios,
      final bool terminado,
      final String price,
      final bool onCreate}) = _$VehiculoImpl;

  factory _Vehiculo.fromJson(Map<String, dynamic> json) =
      _$VehiculoImpl.fromJson;

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
  DateTime? get entrada;
  @override
  DateTime? get salida;
  @override
  ServiceInfo? get servicios;
  @override
  bool get terminado;
  @override
  String get price;
  @override
  bool get onCreate;
  @override
  @JsonKey(ignore: true)
  _$$VehiculoImplCopyWith<_$VehiculoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
