import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "jornada_state_provider.g.dart";

//TODO hacer funcinar apartir de aqui el estado de la jornada
@Riverpod(keepAlive: true)
class JornadaState extends _$JornadaState {
  @override
  FutureOr<Jornada?> build() {
    return _fetch();
  }

  Future<Jornada?> _fetch() async {
    final Jornada? jornada =
        await ref.read(jornadasListProvider.notifier).getCurrentJornada();
    if (jornada != null) {
      await ref
          .read(serviceListProvider.notifier)
          .loadServicesToDay(jornada.jornadasListIDs);
      await ref
          .read(entradaSalidaListProvider.notifier)
          .loadDataToday(jornada.entradaSalidaIDs);
      state = AsyncValue.data(jornada);
      await calcularValores();
    }

    return state.value;
  }

  Future<void> editarJornada(Jornada jornada) async {
    await ref.read(jornadasListProvider.notifier).editJornada(jornada);
  }

  void iniciarJornada(int cajaicial) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final jorndadInit = Jornada(
        id: const Uuid().v4(),
        dateInit: DateTime.now(),
        cajaInicial: cajaicial,
        enJornada: true,
      );
      await ref.read(jornadasListProvider.notifier).addJornada(jorndadInit);
      return jorndadInit;
    });
    calcularValores();
  }

  void finalizarJornada() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final Jornada? jorndadInit =
          state.value?.copyWith(dateEnd: DateTime.now(), enJornada: false);
      editarJornada(jorndadInit!);
      return _fetch();
    });
  }

  Future<void> addServicio(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final Jornada? jorndadInit = state.value
          ?.copyWith(jornadasListIDs: [id, ...state.value!.jornadasListIDs]);
      editarJornada(jorndadInit!);

      return jorndadInit;
    });
    calcularValores();
  }

  deleteServicio(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final Jornada? jorndadInit = state.value;
      jorndadInit!.jornadasListIDs.remove(id);
      editarJornada(jorndadInit);
      return jorndadInit;
    });
    calcularValores();
  }

  addEntradaSalida(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final Jornada? jorndadInit = state.value
          ?.copyWith(entradaSalidaIDs: [id, ...state.value!.entradaSalidaIDs]);
      editarJornada(jorndadInit!);
      return jorndadInit;
    });
    calcularValores();
  }

  deleteEntradaSalida(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final Jornada? jorndadInit = state.value;
      jorndadInit!.entradaSalidaIDs.remove(id);
      editarJornada(jorndadInit);
      return jorndadInit;
    });
    calcularValores();
  }

  Future<void> calcularValores() async {
    // calcular valores
    state = await AsyncValue.guard(() async {
      Jornada? jorndadInit = state.value;
      final caja = jorndadInit?.cajaInicial ?? 0;
      final Map<String, int> infoServiceList =
          await ref.read(serviceListProvider.notifier).getServicesCount();

      final Map<String, int> infoEntradaSalidaList = await ref
          .read(entradaSalidaListProvider.notifier)
          .getEntradaSalidaCount();

      jorndadInit = jorndadInit?.copyWith(
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
    });
  }
}
