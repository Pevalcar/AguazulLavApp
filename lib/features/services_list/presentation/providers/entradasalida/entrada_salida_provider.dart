import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrada_salida_provider.g.dart';

//entrdada y saldia usecase Riverpods

@riverpod
EntradaSalidaDataSource entradaSalidaDataSource(
    EntradaSalidaDataSourceRef ref) {
  final localDataSource =
      FirebaseFirestore.instance.collection("EntradaSalida");
  return EntradaSalidaDataSource(localDataSource);
}

@riverpod
EntradaSalidaRepositoryImpl entradaSalidaRepository(
    EntradaSalidaRepositoryRef ref) {
  final localDataSource = ref.watch(entradaSalidaDataSourceProvider);
  return EntradaSalidaRepositoryImpl(localDataSource);
}

@riverpod
GetEntradaSalidaToday getEntradaSalidaToday(GetEntradaSalidaTodayRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return GetEntradaSalidaToday(repository);
}

@riverpod
GetEntradasSalidas getEntradaSalida(GetEntradaSalidaRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return GetEntradasSalidas(repository);
}

@riverpod
AddEntradaSalida addEntradaSalida(AddEntradaSalidaRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return AddEntradaSalida(repository);
}

@riverpod
DeleteEntradaSalida deleteEntradaSalida(DeleteEntradaSalidaRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return DeleteEntradaSalida(repository);
}

@Riverpod(keepAlive: true)
class EntradaSalidaList extends _$EntradaSalidaList {
  @override
  FutureOr<List<EntradaSalida>> build() {
    return [];
  }

  Future loadData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = [];
      list = await ref.read(getEntradaSalidaProvider).call();
      return list;
    });
  }

  Future<void> loadDataToday(List<String> ids) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = [];
      list = await ref.read(getEntradaSalidaTodayProvider).call(ids);
      return list;
    });
  }

  void addEntradaSalida(EntradaSalida entradaSalida) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = state.value ?? [];
      await ref.read(addEntradaSalidaProvider).call(entradaSalida);
      await ref
          .read(jornadaStateProvider.notifier)
          .addEntradaSalida(entradaSalida.id);
      list.insert(0, entradaSalida);
      return list;
    });
  }

  void deleteEntradaSalida(EntradaSalida entradaSalida) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = state.value ?? [];
      await ref.read(deleteEntradaSalidaProvider).call(entradaSalida);
      await ref
          .read(jornadaStateProvider.notifier)
          .deleteEntradaSalida(entradaSalida.id);
      list.remove(entradaSalida);
      return list;
    });
  }
}
