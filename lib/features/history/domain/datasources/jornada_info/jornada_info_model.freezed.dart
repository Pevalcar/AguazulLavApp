// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jornada_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JornadaInfoModel _$JornadaInfoModelFromJson(Map<String, dynamic> json) {
  return _JornadaInfoModel.fromJson(json);
}

/// @nodoc
mixin _$JornadaInfoModel {
  Jornada get jornada => throw _privateConstructorUsedError;
  List<EntradaSalida> get entradaSalidasList =>
      throw _privateConstructorUsedError;
  List<Vehicle> get serviciosList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JornadaInfoModelCopyWith<JornadaInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JornadaInfoModelCopyWith<$Res> {
  factory $JornadaInfoModelCopyWith(
          JornadaInfoModel value, $Res Function(JornadaInfoModel) then) =
      _$JornadaInfoModelCopyWithImpl<$Res, JornadaInfoModel>;
  @useResult
  $Res call(
      {Jornada jornada,
      List<EntradaSalida> entradaSalidasList,
      List<Vehicle> serviciosList});

  $JornadaCopyWith<$Res> get jornada;
}

/// @nodoc
class _$JornadaInfoModelCopyWithImpl<$Res, $Val extends JornadaInfoModel>
    implements $JornadaInfoModelCopyWith<$Res> {
  _$JornadaInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jornada = null,
    Object? entradaSalidasList = null,
    Object? serviciosList = null,
  }) {
    return _then(_value.copyWith(
      jornada: null == jornada
          ? _value.jornada
          : jornada // ignore: cast_nullable_to_non_nullable
              as Jornada,
      entradaSalidasList: null == entradaSalidasList
          ? _value.entradaSalidasList
          : entradaSalidasList // ignore: cast_nullable_to_non_nullable
              as List<EntradaSalida>,
      serviciosList: null == serviciosList
          ? _value.serviciosList
          : serviciosList // ignore: cast_nullable_to_non_nullable
              as List<Vehicle>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JornadaCopyWith<$Res> get jornada {
    return $JornadaCopyWith<$Res>(_value.jornada, (value) {
      return _then(_value.copyWith(jornada: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JornadaInfoModelImplCopyWith<$Res>
    implements $JornadaInfoModelCopyWith<$Res> {
  factory _$$JornadaInfoModelImplCopyWith(_$JornadaInfoModelImpl value,
          $Res Function(_$JornadaInfoModelImpl) then) =
      __$$JornadaInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Jornada jornada,
      List<EntradaSalida> entradaSalidasList,
      List<Vehicle> serviciosList});

  @override
  $JornadaCopyWith<$Res> get jornada;
}

/// @nodoc
class __$$JornadaInfoModelImplCopyWithImpl<$Res>
    extends _$JornadaInfoModelCopyWithImpl<$Res, _$JornadaInfoModelImpl>
    implements _$$JornadaInfoModelImplCopyWith<$Res> {
  __$$JornadaInfoModelImplCopyWithImpl(_$JornadaInfoModelImpl _value,
      $Res Function(_$JornadaInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jornada = null,
    Object? entradaSalidasList = null,
    Object? serviciosList = null,
  }) {
    return _then(_$JornadaInfoModelImpl(
      jornada: null == jornada
          ? _value.jornada
          : jornada // ignore: cast_nullable_to_non_nullable
              as Jornada,
      entradaSalidasList: null == entradaSalidasList
          ? _value._entradaSalidasList
          : entradaSalidasList // ignore: cast_nullable_to_non_nullable
              as List<EntradaSalida>,
      serviciosList: null == serviciosList
          ? _value._serviciosList
          : serviciosList // ignore: cast_nullable_to_non_nullable
              as List<Vehicle>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JornadaInfoModelImpl implements _JornadaInfoModel {
  const _$JornadaInfoModelImpl(
      {required this.jornada,
      final List<EntradaSalida> entradaSalidasList = const [],
      final List<Vehicle> serviciosList = const []})
      : _entradaSalidasList = entradaSalidasList,
        _serviciosList = serviciosList;

  factory _$JornadaInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JornadaInfoModelImplFromJson(json);

  @override
  final Jornada jornada;
  final List<EntradaSalida> _entradaSalidasList;
  @override
  @JsonKey()
  List<EntradaSalida> get entradaSalidasList {
    if (_entradaSalidasList is EqualUnmodifiableListView)
      return _entradaSalidasList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entradaSalidasList);
  }

  final List<Vehicle> _serviciosList;
  @override
  @JsonKey()
  List<Vehicle> get serviciosList {
    if (_serviciosList is EqualUnmodifiableListView) return _serviciosList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviciosList);
  }

  @override
  String toString() {
    return 'JornadaInfoModel(jornada: $jornada, entradaSalidasList: $entradaSalidasList, serviciosList: $serviciosList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JornadaInfoModelImpl &&
            (identical(other.jornada, jornada) || other.jornada == jornada) &&
            const DeepCollectionEquality()
                .equals(other._entradaSalidasList, _entradaSalidasList) &&
            const DeepCollectionEquality()
                .equals(other._serviciosList, _serviciosList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jornada,
      const DeepCollectionEquality().hash(_entradaSalidasList),
      const DeepCollectionEquality().hash(_serviciosList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JornadaInfoModelImplCopyWith<_$JornadaInfoModelImpl> get copyWith =>
      __$$JornadaInfoModelImplCopyWithImpl<_$JornadaInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JornadaInfoModelImplToJson(
      this,
    );
  }
}

abstract class _JornadaInfoModel implements JornadaInfoModel {
  const factory _JornadaInfoModel(
      {required final Jornada jornada,
      final List<EntradaSalida> entradaSalidasList,
      final List<Vehicle> serviciosList}) = _$JornadaInfoModelImpl;

  factory _JornadaInfoModel.fromJson(Map<String, dynamic> json) =
      _$JornadaInfoModelImpl.fromJson;

  @override
  Jornada get jornada;
  @override
  List<EntradaSalida> get entradaSalidasList;
  @override
  List<Vehicle> get serviciosList;
  @override
  @JsonKey(ignore: true)
  _$$JornadaInfoModelImplCopyWith<_$JornadaInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
