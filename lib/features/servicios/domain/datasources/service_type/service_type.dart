import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_type.freezed.dart';
part 'service_type.g.dart';

@freezed
class ServiceType with _$ServiceType {
  const factory ServiceType({
    @Default("") String servicioId,
    @Default("Lavado") String nameService,
    @Default("") String description,
    @Default("") String price,
    @Default("") String icon,
  }) = _ServiceType;

  factory ServiceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeFromJson(json);

  
}
