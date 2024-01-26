import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'jornada_list_provider.g.dart';

@riverpod
JornadaDataSource jornadaDataSource(JornadaDataSourceRef ref) {
  final dataResource = FirebaseFirestore.instance.collection("Jornadas");
  return JornadaDataSource(dataResource);
}

@riverpod
JornadaRepositoryImpl jornadaRepository(JornadaRepositoryRef ref) {
  final localDataSource = ref.watch(jornadaDataSourceProvider);
  return JornadaRepositoryImpl(localDataSource);
}

@riverpod
GetJornadas getJornadas(GetJornadasRef ref) {
  final repository = ref.watch(jornadaRepositoryProvider);
  return GetJornadas(repository);
}

@riverpod
AddJornada addJornada(AddJornadaRef ref) {
  final repository = ref.watch(jornadaRepositoryProvider);
  return AddJornada(repository);
}

@riverpod
DeleteJornada deleteJornada(DeleteJornadaRef ref) {
  final repository = ref.watch(jornadaRepositoryProvider);
  return DeleteJornada(repository);
}

@riverpod
EditJornada editJornada(EditJornadaRef ref) {
  final repository = ref.watch(jornadaRepositoryProvider);
  return EditJornada(repository);
}

@riverpod
GetCurrentJornada getCurrentJornada(GetCurrentJornadaRef ref) {
  final repository = ref.watch(jornadaRepositoryProvider);
  return GetCurrentJornada(repository);
}

@riverpod
class JornadasList extends _$JornadasList {
  @override
  FutureOr<List<Jornada>> build() async {
    return _fetch();
  }

  Future<List<Jornada>> _fetch() async {
    List<Jornada> list = [];
    list = await ref.read(getJornadasProvider).call();
    return list;
  }

  Future<void> addJornada(Jornada jornada) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Jornada> list = state.value?.toList() ?? [];
      Jornada? addedJornada = await ref.read(addJornadaProvider).call(jornada);

      list = [addedJornada ?? jornada, ...list];
      return list;
    });
  }

  void deleteJornada(Jornada jornada) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Jornada> list = state.value ?? [];
      await ref.read(deleteJornadaProvider).call(jornada);
      list.remove(jornada);
      return list;
    });
  }

  Future<Jornada?> getJornadaById(String id) async {
    final Jornada? jornada =
        state.value?.firstWhere((element) => element.id == id);
    if (jornada != null) {
      return jornada;
    }
    state = await AsyncValue.guard(() async {
      return ref.read(getJornadasProvider).call();
    });
    return state.value?.firstWhere((element) => element.id == id);
  }

  Future<Jornada> editJornada(Jornada jornada) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Jornada> list = state.value?.toList() ?? [];
      int index = list.indexWhere(
        (element) => element.id == jornada.id,
      );
      await ref.read(editJornadaProvider).call(jornada);
      list.removeWhere(
        (element) => element.id == jornada.id,
      );
      list.insert(index, jornada);
      return list;
    });
    return jornada;
  }

  Future<Jornada?> getCurrentJornada() async {
    final Jornada? jornada = await ref.read(getCurrentJornadaProvider).call();
    return jornada;
  }
}
