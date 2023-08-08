import 'package:freezed_annotation/freezed_annotation.dart';

part 'rutes.freezed.dart';

@freezed
class Rutas with _$Rutas {
  const factory Rutas.Principal({@Default("/") String route}) = _Principal;

  const factory Rutas.AddService({@Default("/Ser") String route}) = _AddService;
}
