// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoState _$PhotoStateFromJson(Map<String, dynamic> json) {
  return _PhotoState.fromJson(json);
}

/// @nodoc
mixin _$PhotoState {
  String get url => throw _privateConstructorUsedError;
  String get photoName => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoStateCopyWith<PhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoStateCopyWith<$Res> {
  factory $PhotoStateCopyWith(
          PhotoState value, $Res Function(PhotoState) then) =
      _$PhotoStateCopyWithImpl<$Res, PhotoState>;
  @useResult
  $Res call({String url, String photoName, String? message, String? code});
}

/// @nodoc
class _$PhotoStateCopyWithImpl<$Res, $Val extends PhotoState>
    implements $PhotoStateCopyWith<$Res> {
  _$PhotoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? photoName = null,
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      photoName: null == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoStateImplCopyWith<$Res>
    implements $PhotoStateCopyWith<$Res> {
  factory _$$PhotoStateImplCopyWith(
          _$PhotoStateImpl value, $Res Function(_$PhotoStateImpl) then) =
      __$$PhotoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String photoName, String? message, String? code});
}

/// @nodoc
class __$$PhotoStateImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$PhotoStateImpl>
    implements _$$PhotoStateImplCopyWith<$Res> {
  __$$PhotoStateImplCopyWithImpl(
      _$PhotoStateImpl _value, $Res Function(_$PhotoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? photoName = null,
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$PhotoStateImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      photoName: null == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoStateImpl implements _PhotoState {
  const _$PhotoStateImpl(
      {required this.url,
      required this.photoName,
      this.message = null,
      this.code = null});

  factory _$PhotoStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoStateImplFromJson(json);

  @override
  final String url;
  @override
  final String photoName;
  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final String? code;

  @override
  String toString() {
    return 'PhotoState(url: $url, photoName: $photoName, message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoStateImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.photoName, photoName) ||
                other.photoName == photoName) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, photoName, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoStateImplCopyWith<_$PhotoStateImpl> get copyWith =>
      __$$PhotoStateImplCopyWithImpl<_$PhotoStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoStateImplToJson(
      this,
    );
  }
}

abstract class _PhotoState implements PhotoState {
  const factory _PhotoState(
      {required final String url,
      required final String photoName,
      final String? message,
      final String? code}) = _$PhotoStateImpl;

  factory _PhotoState.fromJson(Map<String, dynamic> json) =
      _$PhotoStateImpl.fromJson;

  @override
  String get url;
  @override
  String get photoName;
  @override
  String? get message;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$PhotoStateImplCopyWith<_$PhotoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
