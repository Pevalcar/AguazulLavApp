import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/models.dart';

part 'add_service_state_provider.g.dart';

@Riverpod(keepAlive: true)
class VehiculoState extends _$VehiculoState {
  @override
  Vehicle build() => const Vehicle();


  void addService (){
    bool _formValide = ref.read(keyFromAddServiceProvider.notifier).CheckValues();
      if (!_formValide){
        return;
      }

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
    final endTime = "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
    state = state.copyWith(salida: endTime, terminado: true);
  }
  void reset() {
    state = const Vehicle();
  }
}

@riverpod
class ErrorState extends _$ErrorState {
  @override
  String? build() {
    return null;
  }

  void sendError(String error) {
    state = error;
  }

  void reset() {
    state = null;
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
List<ServiceInfo> ListService(ListServiceRef ref) {
  final listServices = ref.watch(servicesListProvider);
  return listServices;
}

@riverpod
String CurrentTime(CurrentTimeRef ref) {
  final time = DateTime.now();

  return "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
}
