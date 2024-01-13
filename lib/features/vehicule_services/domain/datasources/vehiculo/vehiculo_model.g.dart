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
      typeService: json['typeService'] as String,
      typePrice: json['typePrice'] as int,
      diaJronada: DateTime.parse(json['diaJronada'] as String),
      propietarioid: json['propietarioid'] as String,
      entrada: DateTime.parse(json['entrada'] as String),
      trabjador: json['trabjador'] as String,
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
      'typeService': instance.typeService,
      'typePrice': instance.typePrice,
      'diaJronada': instance.diaJronada.toIso8601String(),
      'propietarioid': instance.propietarioid,
      'entrada': instance.entrada.toIso8601String(),
      'trabjador': instance.trabjador,
      'salida': instance.salida?.toIso8601String(),
      'terminado': instance.terminado,
      'onCreate': instance.onCreate,
    };
