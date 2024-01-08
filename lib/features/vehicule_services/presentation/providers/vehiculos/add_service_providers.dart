import 'package:aguazullavapp/lib.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "add_service_providers.g.dart";

@riverpod
AddVehiculo addVehiculo(AddVehiculoRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return AddVehiculo(repository);
}

@riverpod
DeleteVehiculo deleteVehiculo(DeleteVehiculoRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return DeleteVehiculo(repository);
}

@riverpod
ModifiVehiculo modifieVehicule(ModifieVehiculeRef ref) {
  final repository = ref.watch(vehiculoRepositoryProvider);
  return ModifiVehiculo(repository);
}

@riverpod
class VehiculoState extends _$VehiculoState {
  @override
  FutureOr<Vehicle?> build() => null;

  void setDataVehicle(Vehicle vehicle) {
    state = const AsyncValue.loading();
    state = AsyncValue.data(vehicle);
  }

  void addVehiculo(
      Function()? onCarroSave, Function(String)? onSaveError) async {
    final _photo = ref.watch(photoVehiculeProvider).asData?.value?.url;
    final _propietario = ref.watch(propietarioProvider)?.id;
    final _typeService = ref.watch(serviceTypeSelectProvider)?.clase ?? "";
    final _worker = ref.watch(trabajadorNameProvider);
    final _placa = ref.watch(placaProvider);
    if (_photo == null) {
      return onSaveError?.call("Favor de subir una imagen");
    }
    if (_propietario == null) {
      return onSaveError?.call("Favor de seleccionar un propietario");
    }
    if (_typeService.isEmpty) {
      return onSaveError?.call("Favor de selecionar un Servicio");
    }
    if (_worker.isEmpty) {
      return onSaveError?.call("Favor de selecionar un Trabajador");
    }
    if (_placa.isEmpty) {
      return onSaveError?.call("Favor de colocar una Placa");
    }

    final Vehicle carro = Vehicle(
      id: const Uuid().v4(),
      photo: _photo,
      propietarioid: _propietario,
      placa: _placa,
      entrada: DateTime.now(),
      typeService: _typeService,
      typePrice: correctionPrice(ref.watch(serviceTypeSelectProvider)?.price),
      trabjador: _worker,
    );

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      //TODO ? retornar un
      await ref.read(addVehiculoProvider).call(carro);
      if (onCarroSave != null) {
        onCarroSave();
      }
      return carro;
    });
  }

  void deleteVehiculo(Function()? callback) {}
  void modifierVehiculo(Function()? callback) {}
}

@riverpod
class Propietario extends _$Propietario {
  @override
  User? build() {
    return null;
  }

  void modifyPropietario(User propietario) {
    state = propietario;
  }
}

@riverpod
class Placa extends _$Placa {
  @override
  String build() {
    return "";
  }

  void modifyPlaca(String placa) {
    state = placa;
  }
}

@riverpod
class TypoDeVehiculo extends _$TypoDeVehiculo {
  //TODO fecth de datos sobre base de typos
  _fetchTypo() {
    final typo = ref.watch(typosDeVeiculosProvider);
    return typo.first;
  }

  @override
  String build() {
    return _fetchTypo();
  }

  void modifyTypo(String tipo) {
    state = tipo;
  }
}

@riverpod
class ServiceTypeSelect extends _$ServiceTypeSelect {
  @override
  ServiceType? build() {
    return null;
  }

  void modifyServiceType(ServiceType type) {
    state = type;
  }
}

@riverpod
class TrabajadorName extends _$TrabajadorName {
  @override
  String build() {
    return "";
  }

  void modifyTrabajadorName(String name) {
    state = name;
  }
}

int correctionPrice(String? value) {
  if (value == null) {
    return 0;
  }
  return int.parse(value
      .replaceAll('.00', '')
      .replaceAll(',', '')
      .replaceAll('\$', '')
      .trim());
}
