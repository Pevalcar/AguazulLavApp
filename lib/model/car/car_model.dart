import 'package:aguazullavapp/model/propietary/user.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';

part 'car_model.g.dart';

enum VeiculoType { AutoMovil, Motosicleta, Campero, Camioneta, Bus, Camion, Otro }
enum Servicio { Basico, Eco, Pro, Vip, Otro }
@freezed
class Veiculo with _$Veiculo {
  const factory Veiculo({
     @Default("") String id ,
    @Default("") String photo ,
    @Default(VeiculoType.AutoMovil) VeiculoType type,
    @Default(User(id: "id", name: "name", phone: "phone"))User propietario,
    @Default("")String entrada,
    @Default("")String salida,
    @Default(Servicio.Basico)Servicio servicios,
    @Default(false)bool terminado,
     @Default("0")String price,
  }) = _Veiculo;

  factory Veiculo.fromJson(Map<String, dynamic> json) =>
      _$VeiculoFromJson(json);
}
