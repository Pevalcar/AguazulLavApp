import 'package:aguazullavapp/lib.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "jornada_state_provider.g.dart";

@riverpod
class JornadaState extends _$JornadaState {
  @override
  FutureOr<Jornada?> build() {
    return fetch();
  }

  Future<Jornada?> fetch() async {
    Jornada? jornada =
        await ref.read(jornadasListProvider.notifier).getCurrentJornada();
    if (jornada != null) {
      if (jornada.entradaSalidaIDs.isNotEmpty) {
        await ref
            .read(entradaSalidaListProvider.notifier)
            .loadDataToday(jornada.entradaSalidaIDs);
      }

      if (jornada.jornadasListIDs.isNotEmpty) {
        await ref
            .read(serviceListProvider.notifier)
            .loadServicesToDay(jornada.jornadasListIDs);
      }
      jornada = await calcularValores(jornada);
    } else {
      jornada = Jornada(
        id: "",
        dateInit: DateTime.now(),
        enJornada: false,
        cajaInicial: 0,
      );
      ref.read(serviceListProvider.notifier).cleanList();
      ref.read(entradaSalidaListProvider.notifier).cleanList();
    }
    return jornada;
  }

  Future<void> reloadJornada() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return fetch();
    });
  }

  Future<void> editarJornada(Jornada jornada) async {
    await ref.read(jornadasListProvider.notifier).editJornada(jornada);
  }

  void iniciarJornada(int cajaicial) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      Jornada jorndadInit = Jornada(
        id: const Uuid().v4(),
        dateInit: DateTime.now(),
        cajaInicial: cajaicial,
        enJornada: true,
      );
      await ref.read(jornadasListProvider.notifier).addJornada(jorndadInit);
      return fetch();
    });
  }

  Future<void> finalizarJornada(
      Function(String)? finishedJornada, Function(String)? error) async {
    final coneccion = await (Connectivity().checkConnectivity());
    if (coneccion == ConnectivityResult.none) {
      return error!('No hay internet para finalizar la jornada');
    }
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final Jornada? jorndadInit =
          state.value?.copyWith(dateEnd: DateTime.now(), enJornada: false);
      await editarJornada(jorndadInit!);
      return fetch();
    });
  }

  Future<void> addServicio(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      Jornada? jorndadInit = state.value
          ?.copyWith(jornadasListIDs: [id, ...state.value!.jornadasListIDs]);

      jorndadInit = await calcularValores(jorndadInit!);
      await editarJornada(jorndadInit);

      return jorndadInit;
    });
  }

  Future<void> addEntradaSalida(EntradaSalida entradaSalida) async {
    state = await AsyncValue.guard(() async {
      Jornada? jorndadInit = state.value?.copyWith(entradaSalidaIDs: [
        entradaSalida.id,
        ...state.value!.entradaSalidaIDs
      ]);
      await ref
          .read(entradaSalidaListProvider.notifier)
          .addEntradaSalida(entradaSalida);
      jorndadInit = await calcularValores(jorndadInit!);
      await editarJornada(jorndadInit);
      return jorndadInit;
    });
  }

  Future<void> deleteServicio(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<String> jorndadInit = state.value?.jornadasListIDs.toList() ?? [];
      if (jorndadInit.isNotEmpty) {
        jorndadInit.remove(id);
        Jornada? newJornada =
            state.value?.copyWith(jornadasListIDs: jorndadInit);
        newJornada = await calcularValores(newJornada!);
        await editarJornada(newJornada);
        return newJornada;
      }
      return state.value;
    });
  }

  deleteEntradaSalida(EntradaSalida entradaSalida, int index) async {
    state = await AsyncValue.guard(() async {
      List<String> jorndadInit = List.from(state.value?.entradaSalidaIDs ?? []);

      if (jorndadInit.isNotEmpty) {
        jorndadInit.remove(entradaSalida.id);
        Jornada newJornada =
            state.value!.copyWith(entradaSalidaIDs: jorndadInit);

        await ref
            .read(entradaSalidaListProvider.notifier)
            .deleteEntradaSalida(entradaSalida, index);
        newJornada = await calcularValores(newJornada);
        await editarJornada(newJornada);
        return newJornada;
      } else {
        // Handle the case when jorndadInit is null
        return state.value; // or another appropriate value
      }
    });
  }

  Future<void> reloadCalculos() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await calcularValores(state.value!);
    });
  }

  Future<Jornada> calcularValores(Jornada jornada) async {
    // calcular valores
    Jornada? jorndadInit = jornada;
    final caja = jorndadInit.cajaInicial;
    final Map<String, int> infoServiceList =
        await ref.read(serviceListProvider.notifier).getServicesCount();

    final Map<String, int> infoEntradaSalidaList = await ref
        .read(entradaSalidaListProvider.notifier)
        .getEntradaSalidaCount();

    jorndadInit = jorndadInit.copyWith(
      ingresos: infoServiceList["total"] ?? 0,
      procesos:
          "${infoServiceList["terminado"] ?? 0} de (${infoServiceList["cantidad"] ?? 0})",
      salidas: infoEntradaSalidaList["salidas"] ?? 0,
      entradas: infoEntradaSalidaList["entradas"] ?? 0,
      total: infoServiceList["total"]! +
          infoEntradaSalidaList["entradas"]! -
          infoEntradaSalidaList["salidas"]! +
          caja,
    );

    return jorndadInit;
  }
}
