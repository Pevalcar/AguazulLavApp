// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceInfoImpl _$$ServiceInfoImplFromJson(Map<String, dynamic> json) =>
    _$ServiceInfoImpl(
      servicioId: json['servicioId'] as String? ?? "",
      nameService: json['nameService'] as String? ?? "Lavado",
      description: json['description'] as String? ?? "",
      price: json['price'] as String? ?? "",
      icon: json['icon'] as String? ?? "",
    );

Map<String, dynamic> _$$ServiceInfoImplToJson(_$ServiceInfoImpl instance) =>
    <String, dynamic>{
      'servicioId': instance.servicioId,
      'nameService': instance.nameService,
      'description': instance.description,
      'price': instance.price,
      'icon': instance.icon,
    };
