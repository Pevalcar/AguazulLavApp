import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrada_salida_provider.g.dart';

@riverpod
class EntradaSalidaList extends _$EntradaSalidaList {
  @override
  FutureOr<List<EntradaSalida>> build() {
    return loadData();
  }

//poco usado
  Future<List<EntradaSalida>> loadData() async {
    return await ref.read(getEntradaSalidaLocalProvider).call();
  }

  Future<void> loadDataToday(List<String> ids) async {
    if (ids.isEmpty) {
      state = const AsyncValue.data([]);
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = [];
      list = await ref.read(getEntradaSalidaLocalProvider).call();
      if (list.isNotEmpty || list.length < ids.length) {
        list = await ref.read(getEntradaSalidaTodayProvider).call(ids);
        await ref.read(setListEntradaSalidaLocalProvider).call(list);
      }
      return loadData();
    });
  }

  void cleanList() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(clearEntradaSalidaLocalProvider).call();
      return loadData();
    });
  }

  void addEntradaSalida(EntradaSalida entradaSalida) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(addEntradaSalidaProvider).call(entradaSalida);
      //TODO Cambiar
      await ref
          .read(jornadaStateProvider.notifier)
          .addEntradaSalida(entradaSalida);
      await ref.read(addEntradaSalidaLocalProvider).call(entradaSalida);
      return loadData();
    });
  }

  void deleteEntradaSalida(EntradaSalida entradaSalida, int index) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(deleteEntradaSalidaProvider).call(entradaSalida, index);
      //TODO Cambiar
      await ref
          .read(jornadaStateProvider.notifier)
          .deleteEntradaSalida(entradaSalida.id);
      await ref.read(deleteEntradaSalidaLocalProvider).call(entradaSalida, index);
      return loadData();
    });
  }

  Future<Map<String, int>> getEntradaSalidaCount() async {
    if (state.value == null || state.value!.isEmpty) {
      return {'entradas': 0, 'salidas': 0};
    }
    final entradas =
        state.value?.where((element) => element.entrada == true) ?? [];
    final salidas =
        state.value?.where((element) => element.entrada == false) ?? [];
    int totalEntrdas = 0;
    int totalSalidas = 0;
    entradas.forEach((element) {
      totalEntrdas += element.valor;
    });
    salidas.forEach((element) {
      totalSalidas += element.valor;
    });
    return {
      'entradas': totalEntrdas,
      'salidas': totalSalidas,
    };
  }
}
