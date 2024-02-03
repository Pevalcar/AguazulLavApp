

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jornada_model.freezed.dart';
part 'jornada_model.g.dart';

@freezed
class Jornada with _$Jornada {
  factory Jornada({
    required String id,
    required DateTime? dateInit,
    required bool enJornada,
    required int cajaInicial,
    @Default([]) List<String> jornadasListIDs,
    @Default([]) List<String> entradaSalidaIDs,
    @Default(null) DateTime? dateEnd,
    @Default("0 de (0)") String procesos,
    @Default(0) int ingresos,
    @Default(0) int entradas,
    @Default(0) int salidas,
    @Default(0) int total,


  }) = _Jornada;

  factory Jornada.fromJson(Map<String, dynamic> json) =>
      _$JornadaFromJson(json);
}