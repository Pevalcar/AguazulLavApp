// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceTypeEntity _$ServiceTypeEntityFromJson(Map<String, dynamic> json) {
  return _ServiceTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$ServiceTypeEntity {
  String get servicioId => throw _privateConstructorUsedError;
  String get nameService => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceTypeEntityCopyWith<ServiceTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceTypeEntityCopyWith<$Res> {
  factory $ServiceTypeEntityCopyWith(
          ServiceTypeEntity value, $Res Function(ServiceTypeEntity) then) =
      _$ServiceTypeEntityCopyWithImpl<$Res, ServiceTypeEntity>;
  @useResult
  $Res call(
      {String servicioId,
      String nameService,
      String description,
      String price,
      String icon});
}

/// @nodoc
class _$ServiceTypeEntityCopyWithImpl<$Res, $Val extends ServiceTypeEntity>
    implements $ServiceTypeEntityCopyWith<$Res> {
  _$ServiceTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicioId = null,
    Object? nameService = null,
    Object? description = null,
    Object? price = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      servicioId: null == servicioId
          ? _value.servicioId
          : servicioId // ignore: cast_nullable_to_non_nullable
              as String,
      nameService: null == nameService
          ? _value.nameService
          : nameService // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceTypeEntityImplCopyWith<$Res>
    implements $ServiceTypeEntityCopyWith<$Res> {
  factory _$$ServiceTypeEntityImplCopyWith(_$ServiceTypeEntityImpl value,
          $Res Function(_$ServiceTypeEntityImpl) then) =
      __$$ServiceTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String servicioId,
      String nameService,
      String description,
      String price,
      String icon});
}

/// @nodoc
class __$$ServiceTypeEntityImplCopyWithImpl<$Res>
    extends _$ServiceTypeEntityCopyWithImpl<$Res, _$ServiceTypeEntityImpl>
    implements _$$ServiceTypeEntityImplCopyWith<$Res> {
  __$$ServiceTypeEntityImplCopyWithImpl(_$ServiceTypeEntityImpl _value,
      $Res Function(_$ServiceTypeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicioId = null,
    Object? nameService = null,
    Object? description = null,
    Object? price = null,
    Object? icon = null,
  }) {
    return _then(_$ServiceTypeEntityImpl(
      servicioId: null == servicioId
          ? _value.servicioId
          : servicioId // ignore: cast_nullable_to_non_nullable
              as String,
      nameService: null == nameService
          ? _value.nameService
          : nameService // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceTypeEntityImpl implements _ServiceTypeEntity {
  const _$ServiceTypeEntityImpl(
      {required this.servicioId,
      required this.nameService,
      required this.description,
      required this.price,
      required this.icon});

  factory _$ServiceTypeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceTypeEntityImplFromJson(json);

  @override
  final String servicioId;
  @override
  final String nameService;
  @override
  final String description;
  @override
  final String price;
  @override
  final String icon;

  @override
  String toString() {
    return 'ServiceTypeEntity(servicioId: $servicioId, nameService: $nameService, description: $description, price: $price, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceTypeEntityImpl &&
            (identical(other.servicioId, servicioId) ||
                other.servicioId == servicioId) &&
            (identical(other.nameService, nameService) ||
                other.nameService == nameService) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, servicioId, nameService, description, price, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceTypeEntityImplCopyWith<_$ServiceTypeEntityImpl> get copyWith =>
      __$$ServiceTypeEntityImplCopyWithImpl<_$ServiceTypeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceTypeEntityImplToJson(
      this,
    );
  }
}

abstract class _ServiceTypeEntity implements ServiceTypeEntity {
  const factory _ServiceTypeEntity(
      {required final String servicioId,
      required final String nameService,
      required final String description,
      required final String price,
      required final String icon}) = _$ServiceTypeEntityImpl;

  factory _ServiceTypeEntity.fromJson(Map<String, dynamic> json) =
      _$ServiceTypeEntityImpl.fromJson;

  @override
  String get servicioId;
  @override
  String get nameService;
  @override
  String get description;
  @override
  String get price;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$ServiceTypeEntityImplCopyWith<_$ServiceTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
