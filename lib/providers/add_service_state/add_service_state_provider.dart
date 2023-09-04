import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/models.dart';

part 'add_service_state_provider.g.dart';

@Riverpod(keepAlive: true)
class VehiculoState extends _$VehiculoState {
  @override
  FutureOr<Vehicle> build() async => const Vehicle();

  addService() async {
    Vehicle vehicle = state.asData?.value ?? const Vehicle();

    bool formValide =
        ref.read(keyFromAddServiceProvider.notifier).CheckValues();

    if (!formValide) {
      throw Exception("Error: Faltan datos");
    }
    if (vehicle.photo.isEmpty ||
        vehicle.photo == "https://picsum.photos/200/300") {
      throw Exception("Error: No hay foto");
    }

    if (vehicle.servicios == null) {
      throw Exception("Error: No hay servicios seleccionado.");
    }
    // si el vehiculo es correcto
    try {
      await ref
          .read(serviceListProvider.notifier)
          .addService(state.asData!.value);
      
    } catch (error) {
      throw Exception(error);
    }
  }

  void modifierVehicle(Vehicle vehiculo) {
    state = AsyncValue.data(vehiculo);
  }

  void addPhoto(String photo) {
    state = AsyncValue.data(state.asData!.value.copyWith(photo: photo));
  }

  void modifyType(VeiculoType? type) {
    state = AsyncValue.data(state.asData!.value.copyWith(type: type!));
  }

  void selectService(ServiceInfo service) {
    state = AsyncValue.data(state.asData!.value.copyWith(servicios: service));
  }

  void finished() {
    final time = DateTime.now();
    final endTime =
        "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
    state = AsyncValue.data(
        state.asData!.value.copyWith(salida: endTime, terminado: true));
  }

  void reset() {
    state = const AsyncValue.data(Vehicle());
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
