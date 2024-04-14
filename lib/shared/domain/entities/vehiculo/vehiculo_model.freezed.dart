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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehiculo.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get id => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get placa =>
      throw _privateConstructorUsedError; //Puden cambiar siempre
  String get typeService => throw _privateConstructorUsedError;
  int get typePrice => throw _privateConstructorUsedError;
  DateTime get diaJronada =>
      throw _privateConstructorUsedError; //propietario siempre seran los mismos
  String get propietarioid => throw _privateConstructorUsedError;
  DateTime get entrada => throw _privateConstructorUsedError;
  String get trabjador => throw _privateConstructorUsedError;
  String get photoName => throw _privateConstructorUsedError;
  DateTime? get salida => throw _privateConstructorUsedError;
  bool get terminado => throw _privateConstructorUsedError;
  bool get onCreate => throw _privateConstructorUsedError;
  String get tipoPago => throw _privateConstructorUsedError;
  String get transferenciaPhoto => throw _privateConstructorUsedError;
  String get transferenciaPhotouUrl => throw _privateConstructorUsedError;

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
      String typeService,
      int typePrice,
      DateTime diaJronada,
      String propietarioid,
      DateTime entrada,
      String trabjador,
      String photoName,
      DateTime? salida,
      bool terminado,
      bool onCreate,
      String tipoPago,
      String transferenciaPhoto,
      String transferenciaPhotouUrl});
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
    Object? typeService = null,
    Object? typePrice = null,
    Object? diaJronada = null,
    Object? propietarioid = null,
    Object? entrada = null,
    Object? trabjador = null,
    Object? photoName = null,
    Object? salida = freezed,
    Object? terminado = null,
    Object? onCreate = null,
    Object? tipoPago = null,
    Object? transferenciaPhoto = null,
    Object? transferenciaPhotouUrl = null,
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
      typeService: null == typeService
          ? _value.typeService
          : typeService // ignore: cast_nullable_to_non_nullable
              as String,
      typePrice: null == typePrice
          ? _value.typePrice
          : typePrice // ignore: cast_nullable_to_non_nullable
              as int,
      diaJronada: null == diaJronada
          ? _value.diaJronada
          : diaJronada // ignore: cast_nullable_to_non_nullable
              as DateTime,
      propietarioid: null == propietarioid
          ? _value.propietarioid
          : propietarioid // ignore: cast_nullable_to_non_nullable
              as String,
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trabjador: null == trabjador
          ? _value.trabjador
          : trabjador // ignore: cast_nullable_to_non_nullable
              as String,
      photoName: null == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String,
      salida: freezed == salida
          ? _value.salida
          : salida // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminado: null == terminado
          ? _value.terminado
          : terminado // ignore: cast_nullable_to_non_nullable
              as bool,
      onCreate: null == onCreate
          ? _value.onCreate
          : onCreate // ignore: cast_nullable_to_non_nullable
              as bool,
      tipoPago: null == tipoPago
          ? _value.tipoPago
          : tipoPago // ignore: cast_nullable_to_non_nullable
              as String,
      transferenciaPhoto: null == transferenciaPhoto
          ? _value.transferenciaPhoto
          : transferenciaPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      transferenciaPhotouUrl: null == transferenciaPhotouUrl
          ? _value.transferenciaPhotouUrl
          : transferenciaPhotouUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      String typeService,
      int typePrice,
      DateTime diaJronada,
      String propietarioid,
      DateTime entrada,
      String trabjador,
      String photoName,
      DateTime? salida,
      bool terminado,
      bool onCreate,
      String tipoPago,
      String transferenciaPhoto,
      String transferenciaPhotouUrl});
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
    Object? typeService = null,
    Object? typePrice = null,
    Object? diaJronada = null,
    Object? propietarioid = null,
    Object? entrada = null,
    Object? trabjador = null,
    Object? photoName = null,
    Object? salida = freezed,
    Object? terminado = null,
    Object? onCreate = null,
    Object? tipoPago = null,
    Object? transferenciaPhoto = null,
    Object? transferenciaPhotouUrl = null,
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
      typeService: null == typeService
          ? _value.typeService
          : typeService // ignore: cast_nullable_to_non_nullable
              as String,
      typePrice: null == typePrice
          ? _value.typePrice
          : typePrice // ignore: cast_nullable_to_non_nullable
              as int,
      diaJronada: null == diaJronada
          ? _value.diaJronada
          : diaJronada // ignore: cast_nullable_to_non_nullable
              as DateTime,
      propietarioid: null == propietarioid
          ? _value.propietarioid
          : propietarioid // ignore: cast_nullable_to_non_nullable
              as String,
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trabjador: null == trabjador
          ? _value.trabjador
          : trabjador // ignore: cast_nullable_to_non_nullable
              as String,
      photoName: null == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String,
      salida: freezed == salida
          ? _value.salida
          : salida // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminado: null == terminado
          ? _value.terminado
          : terminado // ignore: cast_nullable_to_non_nullable
              as bool,
      onCreate: null == onCreate
          ? _value.onCreate
          : onCreate // ignore: cast_nullable_to_non_nullable
              as bool,
      tipoPago: null == tipoPago
          ? _value.tipoPago
          : tipoPago // ignore: cast_nullable_to_non_nullable
              as String,
      transferenciaPhoto: null == transferenciaPhoto
          ? _value.transferenciaPhoto
          : transferenciaPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      transferenciaPhotouUrl: null == transferenciaPhotouUrl
          ? _value.transferenciaPhotouUrl
          : transferenciaPhotouUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehiculoImpl with DiagnosticableTreeMixin implements _Vehiculo {
  _$VehiculoImpl(
      {this.id = "",
      required this.photo,
      required this.placa,
      required this.typeService,
      required this.typePrice,
      required this.diaJronada,
      required this.propietarioid,
      required this.entrada,
      required this.trabjador,
      this.photoName = "",
      this.salida = null,
      this.terminado = false,
      this.onCreate = false,
      this.tipoPago = "Efectivo",
      this.transferenciaPhoto = "",
      this.transferenciaPhotouUrl = ""});

  factory _$VehiculoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehiculoImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String photo;
  @override
  final String placa;
//Puden cambiar siempre
  @override
  final String typeService;
  @override
  final int typePrice;
  @override
  final DateTime diaJronada;
//propietario siempre seran los mismos
  @override
  final String propietarioid;
  @override
  final DateTime entrada;
  @override
  final String trabjador;
  @override
  @JsonKey()
  final String photoName;
  @override
  @JsonKey()
  final DateTime? salida;
  @override
  @JsonKey()
  final bool terminado;
  @override
  @JsonKey()
  final bool onCreate;
  @override
  @JsonKey()
  final String tipoPago;
  @override
  @JsonKey()
  final String transferenciaPhoto;
  @override
  @JsonKey()
  final String transferenciaPhotouUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vehicle(id: $id, photo: $photo, placa: $placa, typeService: $typeService, typePrice: $typePrice, diaJronada: $diaJronada, propietarioid: $propietarioid, entrada: $entrada, trabjador: $trabjador, photoName: $photoName, salida: $salida, terminado: $terminado, onCreate: $onCreate, tipoPago: $tipoPago, transferenciaPhoto: $transferenciaPhoto, transferenciaPhotouUrl: $transferenciaPhotouUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vehicle'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('photo', photo))
      ..add(DiagnosticsProperty('placa', placa))
      ..add(DiagnosticsProperty('typeService', typeService))
      ..add(DiagnosticsProperty('typePrice', typePrice))
      ..add(DiagnosticsProperty('diaJronada', diaJronada))
      ..add(DiagnosticsProperty('propietarioid', propietarioid))
      ..add(DiagnosticsProperty('entrada', entrada))
      ..add(DiagnosticsProperty('trabjador', trabjador))
      ..add(DiagnosticsProperty('photoName', photoName))
      ..add(DiagnosticsProperty('salida', salida))
      ..add(DiagnosticsProperty('terminado', terminado))
      ..add(DiagnosticsProperty('onCreate', onCreate))
      ..add(DiagnosticsProperty('tipoPago', tipoPago))
      ..add(DiagnosticsProperty('transferenciaPhoto', transferenciaPhoto))
      ..add(DiagnosticsProperty(
          'transferenciaPhotouUrl', transferenciaPhotouUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiculoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.placa, placa) || other.placa == placa) &&
            (identical(other.typeService, typeService) ||
                other.typeService == typeService) &&
            (identical(other.typePrice, typePrice) ||
                other.typePrice == typePrice) &&
            (identical(other.diaJronada, diaJronada) ||
                other.diaJronada == diaJronada) &&
            (identical(other.propietarioid, propietarioid) ||
                other.propietarioid == propietarioid) &&
            (identical(other.entrada, entrada) || other.entrada == entrada) &&
            (identical(other.trabjador, trabjador) ||
                other.trabjador == trabjador) &&
            (identical(other.photoName, photoName) ||
                other.photoName == photoName) &&
            (identical(other.salida, salida) || other.salida == salida) &&
            (identical(other.terminado, terminado) ||
                other.terminado == terminado) &&
            (identical(other.onCreate, onCreate) ||
                other.onCreate == onCreate) &&
            (identical(other.tipoPago, tipoPago) ||
                other.tipoPago == tipoPago) &&
            (identical(other.transferenciaPhoto, transferenciaPhoto) ||
                other.transferenciaPhoto == transferenciaPhoto) &&
            (identical(other.transferenciaPhotouUrl, transferenciaPhotouUrl) ||
                other.transferenciaPhotouUrl == transferenciaPhotouUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      photo,
      placa,
      typeService,
      typePrice,
      diaJronada,
      propietarioid,
      entrada,
      trabjador,
      photoName,
      salida,
      terminado,
      onCreate,
      tipoPago,
      transferenciaPhoto,
      transferenciaPhotouUrl);

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
      required final String photo,
      required final String placa,
      required final String typeService,
      required final int typePrice,
      required final DateTime diaJronada,
      required final String propietarioid,
      required final DateTime entrada,
      required final String trabjador,
      final String photoName,
      final DateTime? salida,
      final bool terminado,
      final bool onCreate,
      final String tipoPago,
      final String transferenciaPhoto,
      final String transferenciaPhotouUrl}) = _$VehiculoImpl;

  factory _Vehiculo.fromJson(Map<String, dynamic> json) =
      _$VehiculoImpl.fromJson;

  @override
  String get id;
  @override
  String get photo;
  @override
  String get placa;
  @override //Puden cambiar siempre
  String get typeService;
  @override
  int get typePrice;
  @override
  DateTime get diaJronada;
  @override //propietario siempre seran los mismos
  String get propietarioid;
  @override
  DateTime get entrada;
  @override
  String get trabjador;
  @override
  String get photoName;
  @override
  DateTime? get salida;
  @override
  bool get terminado;
  @override
  bool get onCreate;
  @override
  String get tipoPago;
  @override
  String get transferenciaPhoto;
  @override
  String get transferenciaPhotouUrl;
  @override
  @JsonKey(ignore: true)
  _$$VehiculoImplCopyWith<_$VehiculoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
