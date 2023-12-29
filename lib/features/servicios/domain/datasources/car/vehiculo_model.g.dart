// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehiculoImpl _$$VehiculoImplFromJson(Map<String, dynamic> json) =>
    _$VehiculoImpl(
      id: json['id'] as String? ?? "",
      photo: json['photo'] as String? ?? "",
      placa: json['placa'] as String? ?? "",
      type: $enumDecodeNullable(_$VeiculoTypeEnumMap, json['type']) ??
          VeiculoType.autoMovil,
      propietario: json['propietario'] == null
          ? const User()
          : User.fromJson(json['propietario'] as Map<String, dynamic>),
      entrada: json['entrada'] == null
          ? null
          : DateTime.parse(json['entrada'] as String),
      salida: json['salida'] == null
          ? null
          : DateTime.parse(json['salida'] as String),
      servicios: json['servicios'] == null
          ? null
          : ServiceType.fromJson(json['servicios'] as Map<String, dynamic>),
      terminado: json['terminado'] as bool? ?? false,
      price: json['price'] as String? ?? "",
      onCreate: json['onCreate'] as bool? ?? false,
    );

Map<String, dynamic> _$$VehiculoImplToJson(_$VehiculoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'placa': instance.placa,
      'type': _$VeiculoTypeEnumMap[instance.type]!,
      'propietario': instance.propietario,
      'entrada': instance.entrada?.toIso8601String(),
      'salida': instance.salida?.toIso8601String(),
      'servicios': instance.servicios,
      'terminado': instance.terminado,
      'price': instance.price,
      'onCreate': instance.onCreate,
    };

const _$VeiculoTypeEnumMap = {
  VeiculoType.autoMovil: 'autoMovil',
  VeiculoType.motocicleta: 'motocicleta',
  VeiculoType.campero: 'campero',
  VeiculoType.camioneta: 'camioneta',
  VeiculoType.bus: 'bus',
  VeiculoType.camion: 'camion',
  VeiculoType.otro: 'otro',
};
