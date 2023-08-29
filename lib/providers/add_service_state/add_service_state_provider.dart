import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/models.dart';

part 'add_service_state_provider.g.dart';

@Riverpod(keepAlive: true)
class VehiculoState extends _$VehiculoState {
  @override
  Vehicle build() => const Vehicle();

 void addService() {
    
    bool formValide =
        ref.read(keyFromAddServiceProvider.notifier).CheckValues();

    if (!formValide) {
      ref.read(errorStateProvider.notifier).sendError("Error: Faltan datos");
      return;
    }
    // if (state.photo.isEmpty || state.photo == "https://picsum.photos/200/300") {
    //   ref.read(errorStateProvider.notifier).sendError("Error: No hay foto");
    //   return;
    // }
    if (state.servicios == null) {
      ref
          .read(errorStateProvider.notifier)
          .sendError("Error: No hay servicios seleccionado.");
      return;
    }
    // si el vehiculo es correcto
     
    ref.read(serviceListProvider.notifier).addService(state);
    ref.invalidate(serviceListProvider);
  }

  void ModifierVeichle(Vehicle vehiculo) {
    state = vehiculo;
  }

  void ModifyType(VeiculoType? type) {
    state = state.copyWith(type: type!);
  }

  void selectService(ServiceInfo service) {
    state = state.copyWith(servicios: service);
  }

  void finihed() {
    final time = DateTime.now();
    final endTime =
        "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
    state = state.copyWith(salida: endTime, terminado: true);
  }

  void reset() {
    state = const Vehicle();
  }
}

@riverpod
class ErrorState extends _$ErrorState {
  @override
  String build() {
    return "";
  }

  void sendError(String error) {
    state = error;
  }

  void reset() {
    state = "";
  }
}

@riverpod
class KeyFromAddService extends _$KeyFromAddService {
  final _keyForm = GlobalKey<FormState>();

  @override
  GlobalKey<FormState> build() {
    return _keyForm;
  }

  bool CheckValues() {
    return _keyForm.currentState!.validate();
  }
}

@riverpod
String CurrentTime(CurrentTimeRef ref) {
  final time = DateTime.now();

  return "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
}
