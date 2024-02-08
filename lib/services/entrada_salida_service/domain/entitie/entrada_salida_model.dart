import 'package:freezed_annotation/freezed_annotation.dart';

part "entrada_salida_model.freezed.dart";
part 'entrada_salida_model.g.dart';

@freezed
class EntradaSalida with _$EntradaSalida {
  factory EntradaSalida({
    @Default('') String id,
    @Default(null) DateTime? fecha,
    @Default(false) bool entrada,
    required String concepto,
    required int valor,
  }) = _Jornada;

  factory EntradaSalida.fromJson(Map<String, dynamic> json) =>
      _$EntradaSalidaFromJson(json);
}
