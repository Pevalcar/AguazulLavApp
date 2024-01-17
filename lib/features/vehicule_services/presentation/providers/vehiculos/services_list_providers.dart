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

  Future loadServicesToDay( List<String> ids) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(getVehiculesTodayProvider).call(ids);
    });
  }

  Future addService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Vehicle> list = state.value ?? [];
      await ref.read(addVehiculoProvider).call(vehicle);
      await ref.read(jornadaStateProvider.notifier).addServicio(vehicle.id);
      list.insert(0, vehicle);
      return list;
    });
  }

  Future deleteService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      int? index = state.value?.indexWhere((element) => element == vehicle.id);
      List<Vehicle> list = state.value ?? [];
      await ref.read(deleteVehiculoProvider).call(vehicle);
      await ref.read(jornadaStateProvider.notifier).deleteServicio(vehicle.id);
      if (index != null) {
        list.removeAt(index);
      }
      return list;
    });
  }
  Future modifierService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      int? index = state.value?.indexWhere((element) => element == vehicle.id);
      List<Vehicle> list = state.value ?? [];
      await ref.read(modifieVehiculeProvider).call(vehicle);
      if (index != null) {
        list[index] = vehicle;
      }
      return list;
    });
  }

  Future endService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      int? index = state.value?.indexWhere((element) => element == vehicle.id);
      List<Vehicle> list = state.value ?? [];
      Vehicle vehicle0 =
          vehicle.copyWith(terminado: true, salida: DateTime.now());
      await ref.read(modifieVehiculeProvider).call(vehicle0);
      if (index != null) {
        list[index] = vehicle0;
      }
      return list;
    });
  }
}
