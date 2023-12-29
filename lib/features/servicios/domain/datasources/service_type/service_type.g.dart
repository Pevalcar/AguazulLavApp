// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceTypeImpl _$$ServiceTypeImplFromJson(Map<String, dynamic> json) =>
    _$ServiceTypeImpl(
      servicioId: json['servicioId'] as String? ?? "",
      nameService: json['nameService'] as String? ?? "Lavado",
      description: json['description'] as String? ?? "",
      price: json['price'] as String? ?? "",
      icon: json['icon'] as String? ?? "",
    );

Map<String, dynamic> _$$ServiceTypeImplToJson(_$ServiceTypeImpl instance) =>
    <String, dynamic>{
      'servicioId': instance.servicioId,
      'nameService': instance.nameService,
      'description': instance.description,
      'price': instance.price,
      'icon': instance.icon,
    };
