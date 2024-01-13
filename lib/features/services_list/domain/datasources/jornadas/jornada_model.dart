

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jornada_model.freezed.dart';
part 'jornada_model.g.dart';

@freezed
class Jornada with _$Jornada {
  factory Jornada({
    required String id,
    @Default([]) List<String> jornadasListIDs,
    @Default([]) List<String> entradaSalidaIDs,
    required DateTime? dateInit,
    @Default(null) DateTime? dateEnd,
    @Default(false) bool enJornada,
    required int cajaInicial,
    @Default(0) int ingresos,

  }) = _Jornada;

  factory Jornada.fromJson(Map<String, dynamic> json) =>
      _$JornadaFromJson(json);
}