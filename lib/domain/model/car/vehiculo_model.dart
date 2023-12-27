
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehiculo_model.freezed.dart';

part 'vehiculo_model.g.dart';

enum VeiculoType {
  autoMovil,
  motocicleta,
  campero,
  camioneta,
  bus,
  camion,
  otro
}

// ignore: constant_identifier_names
// enum Servicio { Basico, Eco, Pro, Vip, Otro, None }

@freezed
class Vehicle with _$Vehicle {
   factory Vehicle({
    @Default("")String id,
    @Default("")String photo,
    @Default("")String placa,
    @Default(VeiculoType.autoMovil)VeiculoType type,
    @Default(User())User propietario,
    DateTime? entrada,
    DateTime? salida,
    ServiceInfo? servicios,
    @Default(false)bool terminado,
    @Default("")String price,
    @Default(false)bool onCreate,
  }) = _Vehiculo;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

}

