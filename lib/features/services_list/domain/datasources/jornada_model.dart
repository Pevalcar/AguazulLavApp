

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jornada_model.freezed.dart';
part 'jornada_model.g.dart';

@freezed
class Jornada with _$Jornada {
  const factory Jornada({
    @Default('') String id,
    @Default([]) List<String> jornadasList,
    @Default('') DateTime dia,
    @Default(false) bool enJornada,
    @Default(0) int cajaInicial,
    @Default([]) List<String> entrada,
    @Default([]) List<String> salida,
    @Default(0) int ingresos,

  }) = _Jornada;

  factory Jornada.fromJson(Map<String, dynamic> json) =>
      _$JornadaFromJson(json);
}