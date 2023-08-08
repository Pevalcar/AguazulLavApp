import 'package:aguazullavapp/model/propietary/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehiculo_model.freezed.dart';
part 'vehiculo_model.g.dart';

enum VeiculoType {
  AutoMovil,
  Motosicleta,
  Campero,
  Camioneta,
  Bus,
  Camion,
  Otro
}

enum Servicio { Basico, Eco, Pro, Vip, Otro }

@freezed
class Vehiculo with _$Vehiculo {
  const factory Vehiculo({
    @Default("") String id,
    @Default("") String photo,
    @Default("") String placa,
    @Default(VeiculoType.AutoMovil) VeiculoType type,
    @Default(User(id: "", name: "", phone: "")) User propietario,
    @Default("") String entrada,
    @Default("") String salida,
    @Default(Servicio.Basico) Servicio servicios,
    @Default(false) bool terminado,
    @Default("0") String price,
  }) = _Vehiculo;

  factory Vehiculo.fromJson(Map<String, dynamic> json) =>
      _$VehiculoFromJson(json);
}
