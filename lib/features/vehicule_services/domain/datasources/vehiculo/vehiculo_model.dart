import 'package:aguazullavapp/lib.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehiculo_model.freezed.dart';
part 'vehiculo_model.g.dart';


@freezed
class Vehicle with _$Vehicle {
  factory Vehicle({
    @Default("") String id,
    required String photo,
    required String placa,
    required String typeid,
    required String propietarioid,
    required DateTime entrada,
    @Default(null) DateTime? salida,
    @Default(false) bool terminado,
    @Default(false) bool onCreate,
  }) = _Vehiculo;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}
