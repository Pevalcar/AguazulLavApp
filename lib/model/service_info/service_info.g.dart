// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceInfo _$$_ServiceInfoFromJson(Map<String, dynamic> json) =>
    _$_ServiceInfo(
      servicioId: json['servicioId'] as String? ?? "",
      nameService: json['nameService'] as String? ?? "Lavado",
      description: json['description'] as String? ?? "",
      price: json['price'] as String? ?? "",
      icon: json['icon'] as String? ?? "",
    );

Map<String, dynamic> _$$_ServiceInfoToJson(_$_ServiceInfo instance) =>
    <String, dynamic>{
      'servicioId': instance.servicioId,
      'nameService': instance.nameService,
      'description': instance.description,
      'price': instance.price,
      'icon': instance.icon,
    };
