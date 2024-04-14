import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuracion_model.freezed.dart';
part 'configuracion_model.g.dart';

@freezed
class ConfiguracionModel with _$ConfiguracionModel {
  const factory ConfiguracionModel({
    required String nameEmpresa,
    required String lema,
    required String correo,
    required String direccion,
    required String phone,
  }) = _ConfiguracionModel;

  factory ConfiguracionModel.fromJson(Map<String, dynamic> json) =>
      _$ConfiguracionModelFromJson(json);
}
