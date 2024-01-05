import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_type.freezed.dart';
part 'service_type.g.dart';

@freezed
class ServiceType with _$ServiceType {
  //TODO is obsolete? , optener solo informacion que necesita, precio y tipo
  const factory ServiceType({
    @Default('') String servicioId,
    @Default('') String typeVehiculo,
    @Default('') String clase,
    @Default('') String description,
    @Default('') String price, 
  }) = _ServiceType;

  factory ServiceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeFromJson(json);
}
