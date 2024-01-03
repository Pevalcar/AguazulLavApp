import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  void addVehiculo(Function()? callback) async {
    final Vehicle vehicle = Vehicle(
      photo: ref.watch(photoVehiculeProvider).asData?.value?.url ?? "",
      propietarioid: ref.watch(propietarioProvider)?.id ?? "",
      placa: ref.watch(placaProvider),
      typeid: ref.watch(serviceTypeSelectProvider).servicioId,
      entrada: DateTime.now(),
    );

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(addVehiculoProvider).call(vehicle);
      if (callback != null) {
        callback();
      }
      ref.read(serviceListProvider.notifier).loadData();
      return vehicle;
    });
  }

  void deleteVehiculo(Function()? callback) {}
  void modifierVehiculo(Function()? callback) {}
}

@riverpod
class ServiceTypeSelect extends _$ServiceTypeSelect {
  @override
  ServiceType build() {
    return ServiceType();
  }

  void modifyServiceType(ServiceType type) {
    state = type;
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
class IsLoading extends _$IsLoading {
  @override
  bool build() => false;

  toggleState() {
    state = !state;
  }
}

//? FIXME reubircar estos providers

@riverpod
class ListPropietarios extends _$ListPropietarios {
  //TODO fecth de datos sobre base de ´propietarios
  @override
  List<User> build() {
    return <User>[
      const User(name: 'Alice', email: 'alice@example.com', photo: '', address: '', bonus: '' ),
      const User(name: 'Bob', email: 'bob@example.com', photo: '', address: '', bonus: '' ),
      const User(name: 'Charlie', email: 'charlie123@gmail.com', photo: '', address: '', bonus: '' ),
    ];
  }

  addPropietario() {
    final user = const User(name: "PEdro", email: "pedro@pedro", photo: '', address: '', bonus: '' );
    state = [...state, user];
  }
}
