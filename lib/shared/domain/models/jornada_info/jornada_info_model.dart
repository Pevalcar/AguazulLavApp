import 'package:aguazullavapp/lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jornada_info_model.freezed.dart';
part 'jornada_info_model.g.dart';

@freezed
class JornadaInfoModel with _$JornadaInfoModel {
  const factory JornadaInfoModel({
    required Jornada jornada,
    @Default([]) List<EntradaSalida> entradaSalidasList,
    @Default([]) List<Vehicle> serviciosList,
    @Default([]) List<List<Vehicle>> listaOrdenada,
  }) = _JornadaInfoModel;

  factory JornadaInfoModel.fromJson(Map<String, dynamic> json) =>
      _$JornadaInfoModelFromJson(json);
}
