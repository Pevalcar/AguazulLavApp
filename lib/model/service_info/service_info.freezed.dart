// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceInfo _$ServiceInfoFromJson(Map<String, dynamic> json) {
  return _ServiceInfo.fromJson(json);
}

/// @nodoc
mixin _$ServiceInfo {
  String get servicioId => throw _privateConstructorUsedError;
  String get nameService => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceInfoCopyWith<ServiceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceInfoCopyWith<$Res> {
  factory $ServiceInfoCopyWith(
          ServiceInfo value, $Res Function(ServiceInfo) then) =
      _$ServiceInfoCopyWithImpl<$Res, ServiceInfo>;
  @useResult
  $Res call(
      {String servicioId,
      String nameService,
      String description,
      String price,
      String icon});
}

/// @nodoc
class _$ServiceInfoCopyWithImpl<$Res, $Val extends ServiceInfo>
    implements $ServiceInfoCopyWith<$Res> {
  _$ServiceInfoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ServiceInfoCopyWith<$Res>
    implements $ServiceInfoCopyWith<$Res> {
  factory _$$_ServiceInfoCopyWith(
          _$_ServiceInfo value, $Res Function(_$_ServiceInfo) then) =
      __$$_ServiceInfoCopyWithImpl<$Res>;
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
class __$$_ServiceInfoCopyWithImpl<$Res>
    extends _$ServiceInfoCopyWithImpl<$Res, _$_ServiceInfo>
    implements _$$_ServiceInfoCopyWith<$Res> {
  __$$_ServiceInfoCopyWithImpl(
      _$_ServiceInfo _value, $Res Function(_$_ServiceInfo) _then)
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
    return _then(_$_ServiceInfo(
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
class _$_ServiceInfo implements _ServiceInfo {
  const _$_ServiceInfo(
      {this.servicioId = "",
      this.nameService = "Lavado",
      this.description = "",
      this.price = "",
      this.icon = ""});

  factory _$_ServiceInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceInfoFromJson(json);

  @override
  @JsonKey()
  final String servicioId;
  @override
  @JsonKey()
  final String nameService;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String icon;

  @override
  String toString() {
    return 'ServiceInfo(servicioId: $servicioId, nameService: $nameService, description: $description, price: $price, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceInfo &&
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
  _$$_ServiceInfoCopyWith<_$_ServiceInfo> get copyWith =>
      __$$_ServiceInfoCopyWithImpl<_$_ServiceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceInfoToJson(
      this,
    );
  }
}

abstract class _ServiceInfo implements ServiceInfo {
  const factory _ServiceInfo(
      {final String servicioId,
      final String nameService,
      final String description,
      final String price,
      final String icon}) = _$_ServiceInfo;

  factory _ServiceInfo.fromJson(Map<String, dynamic> json) =
      _$_ServiceInfo.fromJson;

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
  _$$_ServiceInfoCopyWith<_$_ServiceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
