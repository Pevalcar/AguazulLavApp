import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_service_state_provider.g.dart';

//TODO : Refactorizar
// @riverpod
// ServiceTypeLocalDatasource serviceTypeLocalDataSource(
//     ServiceTypeLocalDataSourceRef ref) {
//   final Box<ServiceTypeEntity> box = Hive.box(name: 'serviceType');
//   return ServiceTypeLocalDatasource(box);
// }

@riverpod
ServiceTypeFireStoreDatasource serviceTypeFireStoreDatasource(
    ServiceTypeFireStoreDatasourceRef ref) {
  final firestore = FirebaseFirestore.instance.collection("ServiceTypes");
  return ServiceTypeFireStoreDatasource(firestore);
}

@riverpod
ServiceTypeFirebaseRepositoryImpl serviceTypeRepository(
    ServiceTypeRepositoryRef ref) {
  final localDataSource = ref.watch(serviceTypeFireStoreDatasourceProvider);
  return ServiceTypeFirebaseRepositoryImpl(localDataSource);
}

@riverpod
AddServiceType addServiceType(AddServiceTypeRef ref) {
  final repository = ref.watch(serviceTypeRepositoryProvider);
  return AddServiceType(repository);
}

@riverpod
GetServiceType getServiceType(GetServiceTypeRef ref) {
  final repository = ref.watch(serviceTypeRepositoryProvider);
  return GetServiceType(repository);
}

@riverpod
DeleteServiceType deleteServiceType(DeleteServiceTypeRef ref) {
  final repository = ref.watch(serviceTypeRepositoryProvider);
  return DeleteServiceType(repository);
}

@riverpod
ModifieServiceType modifieServiceType(ModifieServiceTypeRef ref) {
  final repository = ref.watch(serviceTypeRepositoryProvider);
  return ModifieServiceType(repository);
}

@riverpod
class ServiceTypeList extends _$ServiceTypeList {
  @override
  Future<List<ServiceType>?> build() {
    return loadData();
  }

  Future<List<ServiceType>?> loadData() async {
    return await ref.watch(serviceTypeRepositoryProvider).GetServicesInfo();
  }

  void addServiceType(ServiceType service) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(serviceTypeRepositoryProvider).addServiceType(service);
      
      return loadData();
    });
  }

  void deleteServiceType(ServiceType service) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(serviceTypeRepositoryProvider).deleteServiceType(service);
      return loadData();
    });
  }

  void modifieServiceType(ServiceType service) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .watch(serviceTypeRepositoryProvider)
          .modifieServiceType(service);
      return loadData();
    });
  }
}

@riverpod
class VehiculoState extends _$VehiculoState {
  @override
  Vehicle build() => Vehicle();

  // addService() async {
  //   Vehicle vehicle = state.asData?.value ?? const Vehicle();

  //   bool formValide =
  //       ref.read(keyFromAddServiceProvider.notifier).CheckValues();

  //   if (vehicle.photo.isEmpty ||
  //       vehicle.photo == "https://picsum.photos/200/300") {
  //     throw Exception("Error: No hay foto");
  //   }

  //   if (vehicle.servicios == null) {
  //     throw Exception("Error: No hay servicios seleccionado.");
  //   }
  //   if (!formValide) {
  //     throw Exception("Error: Faltan datos");
  //   }
  //   state = AsyncValue.data(vehicle.copyWith(price: vehicle.servicios!.price));
  //   // si el vehiculo es correcto
  //   ref.read(isLoadingProvider.notifier).toggleState();
  //   try {
  // await ref
  // .read(serviceListProvider.notifier)
  // .addService(state.asData!.value?.copyWith(onCreate: true));
  //     ref.read(isLoadingProvider.notifier).toggleState();
  //   } catch (error) {
  //     ref.read(isLoadingProvider.notifier).toggleState();
  //     throw Exception(error);
  //   }
  // }

  // void modifierVehicle(Vehicle vehiculo) {
  //   state = AsyncValue.data(vehiculo);
  // }

  // void addPhoto(String photo) {
  //   state = AsyncValue.data(state.asData!.value?.copyWith(photo: photo));
  // }

  void modifyType(VeiculoType? type) {
    debugPrint('type: ${type}');
  }

  void selectService(ServiceType service) {
    state = state.copyWith(servicios: service);
  }

  // void finished() {
  //   final time = DateTime.now();
  //   final endTime =
  //       "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
  //   state = AsyncValue.data(
  //       state.asData!.value?.copyWith(salida: endTime, terminado: true));
  // }

  // void reset() {
  //   state = const AsyncValue.data(Vehicle());
  // }
}

@riverpod
class Placa extends _$Placa {
  @override
  String build() {
    return "";
  }

  void modifyPlaca(String placa) {
    state = placa;
  }
}

@riverpod
class Propietario extends _$Propietario {
  @override
  User build() {
    return User();
  }

  void modifyPropietario(User propietario) {
    state = propietario;
  }
}

@riverpod
class TypoDeVehiculo extends _$TypoDeVehiculo {
  //TODO fecth de datos sobre base de typos
  _fetchTypo() {
    final typo = ref.watch(typosDeVeiculosProvider);
    return typo.first;
  }

  @override
  String build() {
    return _fetchTypo();
  }

  void modifyTypo(String tipo) {
    state = tipo;
  }
}

@riverpod
class IsLoading extends _$IsLoading {
  @override
  bool build() => false;

  toggleState() {
    state = !state;
  }
}

//? FIXME reubircar estos providers

@riverpod
class ListPropietarios extends _$ListPropietarios {
  //TODO fecth de datos sobre base de ´propietarios
  @override
  List<User> build() {
    return <User>[
      User(name: 'Alice', email: 'alice@example.com'),
      User(name: 'Bob', email: 'bob@example.com'),
      User(name: 'Charlie', email: 'charlie123@gmail.com'),
    ];
  }

  addPropietario() {
    final user = User(name: "PEdro", email: "pedro@pedro");
    state = [...state, user];
  }
}

//TODO fetch de datos sobre base de typos
@riverpod
List<String> TyposDeVeiculos(TyposDeVeiculosRef ref) {
  final lista = [
    "BUSETA COLECTIVO",
    "MOTO",
    "AUTOMOVIL",
    "CAMIONETA",
    "TURBO NKR",
    "TURBO NPR",
    "VOLQUETA",
    "DOBLETROQUE",
    "GRUA PLANCHON",
    "CAMION",
    "PAJARITA",
    "CABEZOTE MULA",
    "MOTO CARRO",
    "CARROTANQUE",
    "BUS",
    "BUSETON",
    "BUSETA",
    "TRACTOR",
    "GRUA CON BRAZO",
  ];
  lista.sort();
  lista.add("OTRO.");
  return lista;
}
