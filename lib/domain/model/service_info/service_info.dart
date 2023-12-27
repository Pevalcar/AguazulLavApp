import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_info.freezed.dart';

part 'service_info.g.dart';

@freezed
class ServiceInfo with _$ServiceInfo {
  const factory ServiceInfo({
    @Default("") String servicioId,
    @Default("Lavado") String nameService,
    @Default("") String description,
    @Default("") String price,
    @Default("") String icon,
  }) = _ServiceInfo;

  factory ServiceInfo.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoFromJson(json);
}
