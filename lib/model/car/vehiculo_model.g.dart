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
          VeiculoType.AutoMovil,
      propietario: json['propietario'] == null
          ? const User(id: "", name: "", phone: "")
          : User.fromJson(json['propietario'] as Map<String, dynamic>),
      entrada: json['entrada'] as String? ?? "",
      salida: json['salida'] as String? ?? "",
      servicios: $enumDecodeNullable(_$ServicioEnumMap, json['servicios']) ??
          Servicio.Basico,
      terminado: json['terminado'] as bool? ?? false,
      price: json['price'] as String? ?? "0",
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
  VeiculoType.AutoMovil: 'AutoMovil',
  VeiculoType.Motosicleta: 'Motosicleta',
  VeiculoType.Campero: 'Campero',
  VeiculoType.Camioneta: 'Camioneta',
  VeiculoType.Bus: 'Bus',
  VeiculoType.Camion: 'Camion',
  VeiculoType.Otro: 'Otro',
};

const _$ServicioEnumMap = {
  Servicio.Basico: 'Basico',
  Servicio.Eco: 'Eco',
  Servicio.Pro: 'Pro',
  Servicio.Vip: 'Vip',
  Servicio.Otro: 'Otro',
};
