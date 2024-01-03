// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehiculoImpl _$$VehiculoImplFromJson(Map<String, dynamic> json) =>
    _$VehiculoImpl(
      id: json['id'] as String? ?? "",
      photo: json['photo'] as String,
      placa: json['placa'] as String,
      typeid: json['typeid'] as String,
      propietarioid: json['propietarioid'] as String,
      entrada: DateTime.parse(json['entrada'] as String),
      salida: json['salida'] == null
          ? null
          : DateTime.parse(json['salida'] as String),
      terminado: json['terminado'] as bool? ?? false,
      onCreate: json['onCreate'] as bool? ?? false,
    );

Map<String, dynamic> _$$VehiculoImplToJson(_$VehiculoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'placa': instance.placa,
      'typeid': instance.typeid,
      'propietarioid': instance.propietarioid,
      'entrada': instance.entrada.toIso8601String(),
      'salida': instance.salida?.toIso8601String(),
      'terminado': instance.terminado,
      'onCreate': instance.onCreate,
    };
