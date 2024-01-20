// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jornada_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JornadaImpl _$$JornadaImplFromJson(Map<String, dynamic> json) =>
    _$JornadaImpl(
      id: json['id'] as String,
      jornadasListIDs: (json['jornadasListIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      entradaSalidaIDs: (json['entradaSalidaIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      dateInit: json['dateInit'] == null
          ? null
          : DateTime.parse(json['dateInit'] as String),
      dateEnd: json['dateEnd'] == null
          ? null
          : DateTime.parse(json['dateEnd'] as String),
      enJornada: json['enJornada'] as bool? ?? false,
      cajaInicial: json['cajaInicial'] as int,
      procesos: json['procesos'] as String? ?? "0 de (0)",
      ingresos: json['ingresos'] as int? ?? 0,
      entradas: json['entradas'] as int? ?? 0,
      salidas: json['salidas'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$$JornadaImplToJson(_$JornadaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jornadasListIDs': instance.jornadasListIDs,
      'entradaSalidaIDs': instance.entradaSalidaIDs,
      'dateInit': instance.dateInit?.toIso8601String(),
      'dateEnd': instance.dateEnd?.toIso8601String(),
      'enJornada': instance.enJornada,
      'cajaInicial': instance.cajaInicial,
      'procesos': instance.procesos,
      'ingresos': instance.ingresos,
      'entradas': instance.entradas,
      'salidas': instance.salidas,
      'total': instance.total,
    };
