import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrada_salida_provider.g.dart';


@riverpod
class EntradaSalidaList extends _$EntradaSalidaList {
  @override
  FutureOr<List<EntradaSalida>> build() {
    return [];
  }
  


//poco usado
  Future loadData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = [];
      list = await ref.read(getEntradaSalidaProvider).call();
      return list;
    });
  }

  void cleanList() async {
    await ref.read(clearEntradaSalidaProvider).call();
    state = const AsyncValue.data([]);
  }

  Future<void> loadDataToday(List<String> ids) async {
    if (ids.isEmpty) {
      state = const AsyncValue.data([]);
    }
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
      list.insert(0, entradaSalida);
      await ref.read(addEntradaSalidaProvider).call(entradaSalida);
      await ref
          .read(jornadaStateProvider.notifier)
          .addEntradaSalida(entradaSalida.id);
      return list;
    });
  }

  void deleteEntradaSalida(EntradaSalida entradaSalida, int index) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<EntradaSalida> list = state.value ?? [];
      await ref.read(deleteEntradaSalidaProvider).call(entradaSalida, index);
      list.remove(entradaSalida);
      await ref
          .read(jornadaStateProvider.notifier)
          .deleteEntradaSalida(entradaSalida.id);
      return list;
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
