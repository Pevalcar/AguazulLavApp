
import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_services_provider.g.dart';

@Riverpod(keepAlive: true)
class ServiceList extends _$ServiceList {
late List<Vehicle> listServices;


  @override
  FutureOr<List<Vehicle>> build() async {
    return await ListServicesRepository().GetServicesData();
  }

  addService(Vehicle vehiculo) async {

    state = const AsyncValue.loading();
    await ListServicesRepository().addService(vehiculo);
    listServices = await ListServicesRepository().GetServicesData();
    state = AsyncValue.data(listServices);

  }
  endService(Vehicle vehiculo) async {
    await ListServicesRepository().endService(vehiculo);
    listServices = await ListServicesRepository().GetServicesData();
    state = AsyncValue.data(listServices);
  }

  delete(Vehicle vehiculo) async {
    await ListServicesRepository().deleteService(vehiculo);
    listServices = await ListServicesRepository().GetServicesData();
    state = AsyncValue.data(listServices);
  }
}
