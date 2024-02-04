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
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list =  await ref.read(getEntradaSalidaLocalProvider).call();
      if (list.isEmpty || list.length < ids.length) {
        list = await ref.read(getEntradaSalidaTodayProvider).call(ids);
        await ref.read(setListEntradaSalidaLocalProvider).call(list);
      }
      
      return list;
    });
  }

  void cleanList() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(clearEntradaSalidaLocalProvider).call();
      return await loadData();
    });
  }

  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(addEntradaSalidaProvider).call(entradaSalida);
      await ref.read(addEntradaSalidaLocalProvider).call(entradaSalida);
      return await loadData();
    });
  }
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida, int index) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(deleteEntradaSalidaProvider).call(entradaSalida, index);
      await ref.read(deleteEntradaSalidaLocalProvider).call(entradaSalida, index);
      return await loadData();
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
    for (var element in entradas) {
      totalEntrdas += element.valor;
    }
    for (var element in salidas) {
      totalSalidas += element.valor;
    }
    return {
      'entradas': totalEntrdas,
      'salidas': totalSalidas,
    };
  }
}
