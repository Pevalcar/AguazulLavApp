// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrada_salida_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JornadaImpl _$$JornadaImplFromJson(Map<String, dynamic> json) =>
    _$JornadaImpl(
      id: json['id'] as String? ?? '',
      fecha: json['fecha'] == null
          ? null
          : DateTime.parse(json['fecha'] as String),
      entrada: json['entrada'] as bool? ?? false,
      valor: json['valor'] as int? ?? 0,
    );

Map<String, dynamic> _$$JornadaImplToJson(_$JornadaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fecha': instance.fecha?.toIso8601String(),
      'entrada': instance.entrada,
      'valor': instance.valor,
    };
