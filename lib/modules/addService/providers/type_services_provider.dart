import 'package:aguazullavapp/data/services_type_repository.dart';
import 'package:aguazullavapp/model/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_services_provider.g.dart';

@riverpod
class TypeServicesList extends _$TypeServicesList {

  @override
   List<ServiceInfo> build() => ServiceTypeRepository().GetServicesData().toList();
}