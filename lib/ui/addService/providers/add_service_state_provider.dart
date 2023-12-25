import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_service_state_provider.g.dart';

@riverpod
class VehiculoState extends _$VehiculoState {
  @override
  Vehicle build() => Vehicle();

  // addService() async {
  //   Vehicle vehicle = state.asData?.value ?? const Vehicle();

  //   bool formValide =
  //       ref.read(keyFromAddServiceProvider.notifier).CheckValues();

  //   if (vehicle.photo.isEmpty ||
  //       vehicle.photo == "https://picsum.photos/200/300") {
  //     throw Exception("Error: No hay foto");
  //   }

  //   if (vehicle.servicios == null) {
  //     throw Exception("Error: No hay servicios seleccionado.");
  //   }
  //   if (!formValide) {
  //     throw Exception("Error: Faltan datos");
  //   }
  //   state = AsyncValue.data(vehicle.copyWith(price: vehicle.servicios!.price));
  //   // si el vehiculo es correcto
  //   ref.read(isLoadingProvider.notifier).toggleState();
  //   try {
  // await ref
  // .read(serviceListProvider.notifier)
  // .addService(state.asData!.value?.copyWith(onCreate: true));
  //     ref.read(isLoadingProvider.notifier).toggleState();
  //   } catch (error) {
  //     ref.read(isLoadingProvider.notifier).toggleState();
  //     throw Exception(error);
  //   }
  // }

  // void modifierVehicle(Vehicle vehiculo) {
  //   state = AsyncValue.data(vehiculo);
  // }

  // void addPhoto(String photo) {
  //   state = AsyncValue.data(state.asData!.value?.copyWith(photo: photo));
  // }

  // void modifyType(VeiculoType? type) {
  //   state = AsyncValue.data(state.asData!.value?.copyWith(type: type!));
  // }

  void modifyPropietario(String propietario) {
    state = state.copyWith(propietario: User(name: propietario));
  }

  void modifyPlaca(String placa) {
    state = state.copyWith(placa: placa);
  }

  // void selectService(ServiceInfo service) {
  //   state = AsyncValue.data(state.asData!.value?.copyWith(servicios: service));
  // }

  // void finished() {
  //   final time = DateTime.now();
  //   final endTime =
  //       "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
  //   state = AsyncValue.data(
  //       state.asData!.value?.copyWith(salida: endTime, terminado: true));
  // }

  // void reset() {
  //   state = const AsyncValue.data(Vehicle());
  // }
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
  User build() {
    return User();
  }
  void modifyPropietario(User propietario) {
    state = propietario;

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

//? FIXME reubircar este provider

@riverpod
class ListPropietarios extends _$ListPropietarios {
  
  @override
  List<User> build() {
    return <User>[
    User(name: 'Alice', email: 'alice@example.com'),
    User(name: 'Bob', email: 'bob@example.com'),
    User(name: 'Charlie', email: 'charlie123@gmail.com'),
  ];
  }
  addPropietario() {
    final user = User( name: "PEdro" , email: "pedro@pedro" );
    state = [...state, user];
  }
}