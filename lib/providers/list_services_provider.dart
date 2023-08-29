import 'package:aguazullavapp/data/index.dart';
import 'package:aguazullavapp/model/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_services_provider.g.dart';

@Riverpod(keepAlive: true)
class ServiceList extends _$ServiceList {
  @override
  FutureOr<List<Vehicle>> build() {
    return ListServicesRepository().GetServicesData();
  }

  addService(Vehicle vehiculo) {
    ListServicesRepository().addService(vehiculo);
  }
}
