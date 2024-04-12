import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "add_service_providers.g.dart";

@riverpod
class VehiculoState extends _$VehiculoState {
  @override
  FutureOr<Vehicle?> build() => null;

  void setDataVehicle(Vehicle vehicle) {
    state = const AsyncValue.loading();
    state = AsyncValue.data(vehicle);
  }

  void addVehiculoTest(
      Function()? onCarroSave, Function(String)? onSaveError) async {
    final time = DateTime.now();
    final Vehicle carro = Vehicle(
      id: const Uuid().v4(),
      photo:
          "https://firebasestorage.googleapis.com/v0/b/aguazullavapp.appspot.com/o/prueba.png?alt=media&token=014c8681-7981-49cc-9f9a-0e9b1894c84c",
      propietarioid: "1234",
      photoName: "",
      placa: "ABC123",
      entrada: time,
      typeService: "Servicio",
      typePrice: 5000,
      trabjador: "1234",
      diaJronada: DateTime(time.year, time.month, time.day),
    );

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(serviceListProvider.notifier).addService(carro);
      if (onCarroSave != null) {
        onCarroSave();
      }
      return carro;
    });
  }

  void addVehiculo(
      Function()? onCarroSave, Function(String)? onSaveError) async {
    final PhotoState? photo = ref.watch(photoVehiculeProvider).asData?.value;
    final propietario = ref.watch(propietarioProvider)?.id ?? "nn";
    final typeService = ref.watch(serviceTypeSelectProvider)?.clase ?? "";
    final worker = ref.watch(trabajadorNameProvider);
    final placa = ref.watch(placaProvider);
    if (photo == null) {
      return onSaveError?.call("Porfavor subir una imagen");
    }
    if (propietario == null) {
      return onSaveError?.call("Porfavor seleccionar un propietario");
    }
    if (typeService.isEmpty) {
      return onSaveError?.call("Porfavor selecionar un Servicio");
    }
    if (worker.isEmpty) {
      return onSaveError?.call("Porfavor selecionar un Trabajador");
    }
    if (placa.isEmpty) {
      return onSaveError?.call("Porfavor colocar una Placa");
    }

    final time = DateTime.now();
    final Vehicle carro = Vehicle(
      id: const Uuid().v4(),
      photo: photo.url,
      propietarioid: propietario,
      placa: placa,
      entrada: time,
      typeService: typeService,
      typePrice: correctionPrice(ref.watch(serviceTypeSelectProvider)?.price),
      trabjador: worker,
      diaJronada: DateTime(time.year, time.month, time.day),
      photoName: photo.photoName,
    );

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(serviceListProvider.notifier).addService(carro);
      if (onCarroSave != null) {
        onCarroSave();
      }
      return carro;
    });
  }
}

@riverpod
class Propietario extends _$Propietario {
  @override
  Client? build() {
    return null;
  }

  void modifyPropietario(Client propietario) {
    state = propietario;
  }

  void inputNullUSer(String id) {
    state = Client(
      id: id,
      name: "",
      identification: '',
      phone: '',
    );
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
  fetchTypo() {
    final typo = ref.watch(typosDeVeiculosProvider);
    return typo.first;
  }

  @override
  String build() {
    return fetchTypo();
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
