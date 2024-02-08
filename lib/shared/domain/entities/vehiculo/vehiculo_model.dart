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
    //Puden cambiar siempre
    required String typeService,
    required int typePrice,
    required DateTime diaJronada,
    //propietario siempre seran los mismos
    required String propietarioid,
    required DateTime entrada,
    required String trabjador,
    @Default("") String photoName,
    @Default(null) DateTime? salida,
    @Default(false) bool terminado,
    @Default(false) bool onCreate,
    @Default("Efectivo") String tipoPago,
    @Default("") String transferenciaPhoto,
    @Default("") String transferenciaPhotouUrl,

  }) = _Vehiculo;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}
