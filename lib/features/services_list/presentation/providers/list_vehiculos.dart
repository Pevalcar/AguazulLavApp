import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_vehiculos.g.dart';

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
class ServiceList extends _$ServiceList {
  Future<List<Vehicle>> _fetch() async {
    List<Vehicle> list = [];
    list = await ref.read(getVehiculoProvider).call();
    return list;
  }

  @override
  FutureOr<List<Vehicle>> build() async {
    return _fetch();
  }

  Future loadData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => _fetch());
  }

  void addService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data([vehicle, ...state.value!]);
  }

  endService(Vehicle vehicle) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      int index =
          state.value!.indexWhere((element) => element.id == vehicle.id);
      List<Vehicle> list = state.value!;
      Vehicle vehicle0 =
          vehicle.copyWith(terminado: true, salida: DateTime.now());
      await ref.read(modifieVehiculeProvider).call(vehicle0);
      list[index] = vehicle0;
      return list;
    });
  }
}
