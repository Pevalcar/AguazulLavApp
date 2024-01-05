// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceType _$ServiceTypeFromJson(Map<String, dynamic> json) {
  return _ServiceType.fromJson(json);
}

/// @nodoc
mixin _$ServiceType {
  String get servicioId => throw _privateConstructorUsedError;
  String get typeVehiculo => throw _privateConstructorUsedError;
  String get clase => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceTypeCopyWith<ServiceType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceTypeCopyWith<$Res> {
  factory $ServiceTypeCopyWith(
          ServiceType value, $Res Function(ServiceType) then) =
      _$ServiceTypeCopyWithImpl<$Res, ServiceType>;
  @useResult
  $Res call(
      {String servicioId,
      String typeVehiculo,
      String clase,
      String description,
      String price});
}

/// @nodoc
class _$ServiceTypeCopyWithImpl<$Res, $Val extends ServiceType>
    implements $ServiceTypeCopyWith<$Res> {
  _$ServiceTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicioId = null,
    Object? typeVehiculo = null,
    Object? clase = null,
    Object? description = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      servicioId: null == servicioId
          ? _value.servicioId
          : servicioId // ignore: cast_nullable_to_non_nullable
              as String,
      typeVehiculo: null == typeVehiculo
          ? _value.typeVehiculo
          : typeVehiculo // ignore: cast_nullable_to_non_nullable
              as String,
      clase: null == clase
          ? _value.clase
          : clase // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceTypeImplCopyWith<$Res>
    implements $ServiceTypeCopyWith<$Res> {
  factory _$$ServiceTypeImplCopyWith(
          _$ServiceTypeImpl value, $Res Function(_$ServiceTypeImpl) then) =
      __$$ServiceTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String servicioId,
      String typeVehiculo,
      String clase,
      String description,
      String price});
}

/// @nodoc
class __$$ServiceTypeImplCopyWithImpl<$Res>
    extends _$ServiceTypeCopyWithImpl<$Res, _$ServiceTypeImpl>
    implements _$$ServiceTypeImplCopyWith<$Res> {
  __$$ServiceTypeImplCopyWithImpl(
      _$ServiceTypeImpl _value, $Res Function(_$ServiceTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicioId = null,
    Object? typeVehiculo = null,
    Object? clase = null,
    Object? description = null,
    Object? price = null,
  }) {
    return _then(_$ServiceTypeImpl(
      servicioId: null == servicioId
          ? _value.servicioId
          : servicioId // ignore: cast_nullable_to_non_nullable
              as String,
      typeVehiculo: null == typeVehiculo
          ? _value.typeVehiculo
          : typeVehiculo // ignore: cast_nullable_to_non_nullable
              as String,
      clase: null == clase
          ? _value.clase
          : clase // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceTypeImpl implements _ServiceType {
  const _$ServiceTypeImpl(
      {this.servicioId = '',
      this.typeVehiculo = '',
      this.clase = '',
      this.description = '',
      this.price = ''});

  factory _$ServiceTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceTypeImplFromJson(json);

  @override
  @JsonKey()
  final String servicioId;
  @override
  @JsonKey()
  final String typeVehiculo;
  @override
  @JsonKey()
  final String clase;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String price;

  @override
  String toString() {
    return 'ServiceType(servicioId: $servicioId, typeVehiculo: $typeVehiculo, clase: $clase, description: $description, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceTypeImpl &&
            (identical(other.servicioId, servicioId) ||
                other.servicioId == servicioId) &&
            (identical(other.typeVehiculo, typeVehiculo) ||
                other.typeVehiculo == typeVehiculo) &&
            (identical(other.clase, clase) || other.clase == clase) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, servicioId, typeVehiculo, clase, description, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceTypeImplCopyWith<_$ServiceTypeImpl> get copyWith =>
      __$$ServiceTypeImplCopyWithImpl<_$ServiceTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceTypeImplToJson(
      this,
    );
  }
}

abstract class _ServiceType implements ServiceType {
  const factory _ServiceType(
      {final String servicioId,
      final String typeVehiculo,
      final String clase,
      final String description,
      final String price}) = _$ServiceTypeImpl;

  factory _ServiceType.fromJson(Map<String, dynamic> json) =
      _$ServiceTypeImpl.fromJson;

  @override
  String get servicioId;
  @override
  String get typeVehiculo;
  @override
  String get clase;
  @override
  String get description;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$$ServiceTypeImplCopyWith<_$ServiceTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
