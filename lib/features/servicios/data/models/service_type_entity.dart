import 'package:aguazullavapp/lib.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_type_entity.freezed.dart';
part 'service_type_entity.g.dart';

@freezed
class ServiceTypeEntity with _$ServiceTypeEntity {
  const factory ServiceTypeEntity({
    required String servicioId,
    required String nameService,
    required String description,
    required String price,
    required String icon,
  }) = _ServiceTypeEntity;

  factory ServiceTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeEntityFromJson(json);

  factory ServiceTypeEntity.fromEntity(ServiceType service) =>
      ServiceTypeEntity(
        servicioId: service.servicioId,
        nameService: service.nameService,
        description: service.description,
        price: service.price,
        icon: service.icon,
      );
}
