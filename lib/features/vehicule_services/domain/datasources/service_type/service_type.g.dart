// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceTypeImpl _$$ServiceTypeImplFromJson(Map<String, dynamic> json) =>
    _$ServiceTypeImpl(
      servicioId: json['servicioId'] as String? ?? '',
      typeVehiculo: json['typeVehiculo'] as String? ?? '',
      clase: json['clase'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$$ServiceTypeImplToJson(_$ServiceTypeImpl instance) =>
    <String, dynamic>{
      'servicioId': instance.servicioId,
      'typeVehiculo': instance.typeVehiculo,
      'clase': instance.clase,
      'description': instance.description,
      'price': instance.price,
    };
