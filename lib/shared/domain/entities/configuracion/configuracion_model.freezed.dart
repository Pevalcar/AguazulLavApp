// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuracion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfiguracionModel _$ConfiguracionModelFromJson(Map<String, dynamic> json) {
  return _ConfiguracionModel.fromJson(json);
}

/// @nodoc
mixin _$ConfiguracionModel {
  String get nameEmpresa => throw _privateConstructorUsedError;
  String get lema => throw _privateConstructorUsedError;
  String get correo => throw _privateConstructorUsedError;
  String get direccion => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfiguracionModelCopyWith<ConfiguracionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfiguracionModelCopyWith<$Res> {
  factory $ConfiguracionModelCopyWith(
          ConfiguracionModel value, $Res Function(ConfiguracionModel) then) =
      _$ConfiguracionModelCopyWithImpl<$Res, ConfiguracionModel>;
  @useResult
  $Res call(
      {String nameEmpresa,
      String lema,
      String correo,
      String direccion,
      String phone});
}

/// @nodoc
class _$ConfiguracionModelCopyWithImpl<$Res, $Val extends ConfiguracionModel>
    implements $ConfiguracionModelCopyWith<$Res> {
  _$ConfiguracionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameEmpresa = null,
    Object? lema = null,
    Object? correo = null,
    Object? direccion = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      nameEmpresa: null == nameEmpresa
          ? _value.nameEmpresa
          : nameEmpresa // ignore: cast_nullable_to_non_nullable
              as String,
      lema: null == lema
          ? _value.lema
          : lema // ignore: cast_nullable_to_non_nullable
              as String,
      correo: null == correo
          ? _value.correo
          : correo // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfiguracionModelImplCopyWith<$Res>
    implements $ConfiguracionModelCopyWith<$Res> {
  factory _$$ConfiguracionModelImplCopyWith(_$ConfiguracionModelImpl value,
          $Res Function(_$ConfiguracionModelImpl) then) =
      __$$ConfiguracionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nameEmpresa,
      String lema,
      String correo,
      String direccion,
      String phone});
}

/// @nodoc
class __$$ConfiguracionModelImplCopyWithImpl<$Res>
    extends _$ConfiguracionModelCopyWithImpl<$Res, _$ConfiguracionModelImpl>
    implements _$$ConfiguracionModelImplCopyWith<$Res> {
  __$$ConfiguracionModelImplCopyWithImpl(_$ConfiguracionModelImpl _value,
      $Res Function(_$ConfiguracionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameEmpresa = null,
    Object? lema = null,
    Object? correo = null,
    Object? direccion = null,
    Object? phone = null,
  }) {
    return _then(_$ConfiguracionModelImpl(
      nameEmpresa: null == nameEmpresa
          ? _value.nameEmpresa
          : nameEmpresa // ignore: cast_nullable_to_non_nullable
              as String,
      lema: null == lema
          ? _value.lema
          : lema // ignore: cast_nullable_to_non_nullable
              as String,
      correo: null == correo
          ? _value.correo
          : correo // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: null == direccion
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfiguracionModelImpl implements _ConfiguracionModel {
  const _$ConfiguracionModelImpl(
      {required this.nameEmpresa,
      required this.lema,
      required this.correo,
      required this.direccion,
      required this.phone});

  factory _$ConfiguracionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfiguracionModelImplFromJson(json);

  @override
  final String nameEmpresa;
  @override
  final String lema;
  @override
  final String correo;
  @override
  final String direccion;
  @override
  final String phone;

  @override
  String toString() {
    return 'ConfiguracionModel(nameEmpresa: $nameEmpresa, lema: $lema, correo: $correo, direccion: $direccion, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfiguracionModelImpl &&
            (identical(other.nameEmpresa, nameEmpresa) ||
                other.nameEmpresa == nameEmpresa) &&
            (identical(other.lema, lema) || other.lema == lema) &&
            (identical(other.correo, correo) || other.correo == correo) &&
            (identical(other.direccion, direccion) ||
                other.direccion == direccion) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nameEmpresa, lema, correo, direccion, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfiguracionModelImplCopyWith<_$ConfiguracionModelImpl> get copyWith =>
      __$$ConfiguracionModelImplCopyWithImpl<_$ConfiguracionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfiguracionModelImplToJson(
      this,
    );
  }
}

abstract class _ConfiguracionModel implements ConfiguracionModel {
  const factory _ConfiguracionModel(
      {required final String nameEmpresa,
      required final String lema,
      required final String correo,
      required final String direccion,
      required final String phone}) = _$ConfiguracionModelImpl;

  factory _ConfiguracionModel.fromJson(Map<String, dynamic> json) =
      _$ConfiguracionModelImpl.fromJson;

  @override
  String get nameEmpresa;
  @override
  String get lema;
  @override
  String get correo;
  @override
  String get direccion;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$ConfiguracionModelImplCopyWith<_$ConfiguracionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
