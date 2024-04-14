import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "services_list_providers.g.dart";

//todo deberia escalarlos a core para cargarlosdesde toda la app
@riverpod
VehiculoDataSource vehiculoDataSource(VehiculoDataSourceRef ref) {
  final dataResource = FirebaseFirestore.instance.collection("Servicios");
  return VehiculoDataSource(dataResource);
}

@riverpod
VehiculoRepositoryImpl vehiculoRepository(VehiculoRepositoryRef ref) {
  final localDataSource = ref.watch(vehiculoDataSourceProvider);
  return VehiculoRepositoryImpl(localDataSource);
}

@riverpod
GetVehiculos getVehiculo(GetVehiculoRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return GetVehiculos(repository);
}

@riverpod
AddVehiculo addVehiculo(AddVehiculoRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return AddVehiculo(repository);
}

@riverpod
DeleteVehiculo deleteVehiculo(DeleteVehiculoRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return DeleteVehiculo(repository);
}

@riverpod
ModifiVehiculo modifieVehicule(ModifieVehiculeRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return ModifiVehiculo(repository);
}

@riverpod
GetVehiculesToday getVehiculesToday(GetVehiculesTodayRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);

  return GetVehiculesToday(repository);
}

@Riverpod(keepAlive: true)
class ServiceList extends _$ServiceList {
  @override
  FutureOr<List<Vehicle>> build() {
    return [];
  }

  Future loadData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(getVehiculoProvider).call();
    });
  }

  Future loadServicesToDay(List<String> ids) async {
    if (ids.isEmpty) {
      state = const AsyncValue.data([]);
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.read(getVehiculesTodayProvider).call(ids);
    });
  }

  Future<void> addService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Vehicle> list = state.value?.toList() ?? [];
      await ref.read(addVehiculoProvider).call(vehicle);
      await ref.read(jornadaStateProvider.notifier).addServicio(vehicle.id);
      list.insert(0, vehicle);

      logger.w("añadido servicio ${vehicle.id}");
      logger.w("seze ${list.length} ");
      return list;
    });
  }

  Future deleteService(
    Vehicle vehicle,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Vehicle> list = state.value ?? [];
      await ref
          .read(deletePhotoGrafieProvider)
          .call(vehicle.photoName, vehicle.entrada);
      await ref.read(deleteVehiculoProvider).call(vehicle.id);
      await ref.read(jornadaStateProvider.notifier).deleteServicio(vehicle.id);
      logger.w("Eliminando servicio ${vehicle.id}");
      logger.w("seze ${list.length} ");
      list.remove(vehicle);
      return list;
    });
  }

  void cleanList() {
    state = const AsyncValue.data([]);
  }

  Future modifierService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      int index =
          state.value!.indexWhere((element) => element.id == vehicle.id);
      List<Vehicle> list = state.value ?? [];
      await ref.read(modifieVehiculeProvider).call(vehicle);
      list[index] = vehicle;
      ref.read(jornadaStateProvider.notifier).reloadCalculos();
      return list;
    });
  }

  Future endService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      int index =
          state.value!.indexWhere((element) => element.id == vehicle.id);
      List<Vehicle> list = List.from(state.value ?? []);
      Vehicle vehicle0 =
          vehicle.copyWith(terminado: true, salida: DateTime.now());
      await ref.read(modifieVehiculeProvider).call(vehicle0);
      await ref
          .read(clientListProvider.notifier)
          .updateBonus(vehicle.propietarioid);
      list[index] = vehicle0;
      list = list.toSet().toList();
      ref.read(jornadaStateProvider.notifier).reloadCalculos();
      return list;
    });
  }

  Future<Map<String, int>> getServicesCount() async {
    if (state.value == null || state.value!.isEmpty) {
      return {'terminado': 0, 'cantidad': 0, 'total': 0};
    }
    final endServices =
        state.value?.where((element) => element.terminado == true) ?? [];
    int total = 0;
    for (var element in endServices) {
      total += element.typePrice;
    }
    return {
      'terminado': endServices.length,
      'cantidad': state.value?.length ?? 0,
      'total': total
    };
  }
}
