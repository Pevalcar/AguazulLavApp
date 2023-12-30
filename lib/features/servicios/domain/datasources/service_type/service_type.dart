import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_type.freezed.dart';
part 'service_type.g.dart';

@freezed
class ServiceType with _$ServiceType {
  const factory ServiceType({
    @Default('') String servicioId,
    required String typeVehiculo,
    required String clase,
    required String description,
    required String price, 
  }) = _ServiceType;

  factory ServiceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeFromJson(json);
}
