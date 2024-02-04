// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jornada_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JornadaInfoModelImpl _$$JornadaInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JornadaInfoModelImpl(
      jornada: Jornada.fromJson(json['jornada'] as Map<String, dynamic>),
      entradaSalidasList: (json['entradaSalidasList'] as List<dynamic>?)
              ?.map((e) => EntradaSalida.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      serviciosList: (json['serviciosList'] as List<dynamic>?)
              ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      listaOrdenada: (json['listaOrdenada'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$JornadaInfoModelImplToJson(
        _$JornadaInfoModelImpl instance) =>
    <String, dynamic>{
      'jornada': instance.jornada,
      'entradaSalidasList': instance.entradaSalidasList,
      'serviciosList': instance.serviciosList,
      'listaOrdenada': instance.listaOrdenada,
    };
