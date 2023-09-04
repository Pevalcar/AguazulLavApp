import 'package:aguazullavapp/data/index.dart';
import 'package:aguazullavapp/model/models.dart';
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
}
