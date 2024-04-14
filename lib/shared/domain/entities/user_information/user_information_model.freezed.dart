// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInformationModel _$UserInformationModelFromJson(Map<String, dynamic> json) {
  return _UserInformationModel.fromJson(json);
}

/// @nodoc
mixin _$UserInformationModel {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInformationModelCopyWith<UserInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationModelCopyWith<$Res> {
  factory $UserInformationModelCopyWith(UserInformationModel value,
          $Res Function(UserInformationModel) then) =
      _$UserInformationModelCopyWithImpl<$Res, UserInformationModel>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String password,
      String? displayName,
      String? photoURL,
      bool? emailVerified,
      String? error});
}

/// @nodoc
class _$UserInformationModelCopyWithImpl<$Res,
        $Val extends UserInformationModel>
    implements $UserInformationModelCopyWith<$Res> {
  _$UserInformationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? emailVerified = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInformationModelImplCopyWith<$Res>
    implements $UserInformationModelCopyWith<$Res> {
  factory _$$UserInformationModelImplCopyWith(_$UserInformationModelImpl value,
          $Res Function(_$UserInformationModelImpl) then) =
      __$$UserInformationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String password,
      String? displayName,
      String? photoURL,
      bool? emailVerified,
      String? error});
}

/// @nodoc
class __$$UserInformationModelImplCopyWithImpl<$Res>
    extends _$UserInformationModelCopyWithImpl<$Res, _$UserInformationModelImpl>
    implements _$$UserInformationModelImplCopyWith<$Res> {
  __$$UserInformationModelImplCopyWithImpl(_$UserInformationModelImpl _value,
      $Res Function(_$UserInformationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? emailVerified = freezed,
    Object? error = freezed,
  }) {
    return _then(_$UserInformationModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInformationModelImpl implements _UserInformationModel {
  const _$UserInformationModelImpl(
      {required this.uid,
      required this.email,
      required this.password,
      this.displayName,
      this.photoURL,
      this.emailVerified,
      this.error});

  factory _$UserInformationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInformationModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String password;
  @override
  final String? displayName;
  @override
  final String? photoURL;
  @override
  final bool? emailVerified;
  @override
  final String? error;

  @override
  String toString() {
    return 'UserInformationModel(uid: $uid, email: $email, password: $password, displayName: $displayName, photoURL: $photoURL, emailVerified: $emailVerified, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInformationModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, password,
      displayName, photoURL, emailVerified, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInformationModelImplCopyWith<_$UserInformationModelImpl>
      get copyWith =>
          __$$UserInformationModelImplCopyWithImpl<_$UserInformationModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInformationModelImplToJson(
      this,
    );
  }
}

abstract class _UserInformationModel implements UserInformationModel {
  const factory _UserInformationModel(
      {required final String uid,
      required final String email,
      required final String password,
      final String? displayName,
      final String? photoURL,
      final bool? emailVerified,
      final String? error}) = _$UserInformationModelImpl;

  factory _UserInformationModel.fromJson(Map<String, dynamic> json) =
      _$UserInformationModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get password;
  @override
  String? get displayName;
  @override
  String? get photoURL;
  @override
  bool? get emailVerified;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$UserInformationModelImplCopyWith<_$UserInformationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
