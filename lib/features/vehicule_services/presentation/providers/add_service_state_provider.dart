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

//!Clase que se encarga de cargar los datos
@riverpod
class ServiceTypeList extends _$ServiceTypeList {
  @override
  Future<List<ServiceType>?> build() {
    return loadData();
  }

  Future<List<ServiceType>?> loadData() async {
    return await ref.read(getServiceTypeProvider).call();
  }

  void addServiceType(ServiceType service, Function() onAddDone,Function(String) onCatchError) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(addServiceTypeProvider).call(service);
      onAddDone();
      return loadData();
    });
    if (state.hasError) {
      debugPrint(' error subiendo el servicio : ${state.error}');
      onCatchError("Problemas al agregar servicio, intente mas tarde.");
    }
  }

  void deleteServiceType(ServiceType service) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(deleteServiceTypeProvider).call(service);
      return loadData();
    });
  }

  void modifieServiceType(ServiceType service) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(modifieServiceTypeProvider).call(service);
      return loadData();
    });
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
