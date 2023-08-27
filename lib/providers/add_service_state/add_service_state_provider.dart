import 'package:aguazullavapp/providers/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/models.dart';

part 'add_service_state_provider.g.dart';

@riverpod
List<ServiceInfo> ListService(ListServiceRef ref) {
  final listServices = ref.watch(servicesListProvider);
  return listServices;
}

@riverpod
class ServiceSelect extends _$ServiceSelect {
  @override
  ServiceInfo? build() {
    return null;
  }

  void selectService(ServiceInfo service) {
    state = service;
  }
}

@riverpod
String CurrentTime(CurrentTimeRef ref) {
  final time = DateTime.now();

  return "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
}
