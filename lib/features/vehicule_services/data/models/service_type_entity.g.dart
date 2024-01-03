// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceTypeEntityImpl _$$ServiceTypeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceTypeEntityImpl(
      servicioId: json['servicioId'] as String,
      nameService: json['nameService'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$ServiceTypeEntityImplToJson(
        _$ServiceTypeEntityImpl instance) =>
    <String, dynamic>{
      'servicioId': instance.servicioId,
      'nameService': instance.nameService,
      'description': instance.description,
      'price': instance.price,
      'icon': instance.icon,
    };
