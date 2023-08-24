// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vehiculo _$$_VehiculoFromJson(Map<String, dynamic> json) => _$_Vehiculo(
      id: json['id'] as String? ?? "",
      photo: json['photo'] as String? ?? "",
      placa: json['placa'] as String? ?? "",
      type: $enumDecodeNullable(_$VeiculoTypeEnumMap, json['type']) ??
          VeiculoType.autoMovil,
      propietario: json['propietario'] == null
          ? const User()
          : User.fromJson(json['propietario'] as Map<String, dynamic>),
      entrada: json['entrada'] as String? ?? "",
      salida: json['salida'] as String? ?? "",
      servicios: $enumDecodeNullable(_$ServicioEnumMap, json['servicios']) ??
          Servicio.None,
      terminado: json['terminado'] as bool? ?? false,
      price: json['price'] as String? ?? "",
    );

Map<String, dynamic> _$$_VehiculoToJson(_$_Vehiculo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'placa': instance.placa,
      'type': _$VeiculoTypeEnumMap[instance.type]!,
      'propietario': instance.propietario,
      'entrada': instance.entrada,
      'salida': instance.salida,
      'servicios': _$ServicioEnumMap[instance.servicios]!,
      'terminado': instance.terminado,
      'price': instance.price,
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

const _$ServicioEnumMap = {
  Servicio.Basico: 'Basico',
  Servicio.Eco: 'Eco',
  Servicio.Pro: 'Pro',
  Servicio.Vip: 'Vip',
  Servicio.Otro: 'Otro',
  Servicio.None: 'None',
};
