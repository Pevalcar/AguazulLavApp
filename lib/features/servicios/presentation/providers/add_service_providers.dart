import 'package:aguazullavapp/lib.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "add_service_providers.g.dart";

@riverpod
PhotoDataResource PhotoDataResourcer(PhotoDataResourcerRef ref) {
  final dataResource = FirebaseStorage.instance.ref();
  return PhotoDataResource(dataResource);
}

@riverpod
PhotoDataRepositoryImpl PhotoDataRepositoryp(PhotoDataRepositorypRef ref) {
  final localDataSource = ref.watch(photoDataResourcerProvider);
  return PhotoDataRepositoryImpl(localDataSource);
}

@riverpod
AddPhoto AddPhotoGrafie(AddPhotoGrafieRef ref) {
  final repository = ref.watch(photoDataRepositorypProvider);
  return AddPhoto(repository);
}

@riverpod
DeletePhoto DeletePhotoGrafie(DeletePhotoGrafieRef ref) {
  final repository = ref.watch(photoDataRepositorypProvider);
  return DeletePhoto(repository);
}

@riverpod
class VehiculoState extends _$VehiculoState {
  @override
  FutureOr<Vehicle> build() => Vehicle();

  void setDataVehicle(Vehicle vehicle) {
    state = AsyncValue.loading();
    state = AsyncValue.data(vehicle);
  }
}

//TODO optimizar subida de datos a la red
//provider photo
@riverpod
class PhotoVehicule extends _$PhotoVehicule {
  late XFile _temp;
  @override
  FutureOr<String?> build() {
    return null;
  }

  void modifyPhoto(String photo) async {
    state = AsyncValue.data(photo);
  }

  void uploadPhoto(XFile photo) async {
    _temp = photo;
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.read(addPhotoGrafieProvider).call(_temp);
    });
  }

  void deletePhoto() async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(deletePhotoGrafieProvider).call(_temp);
      return null;
    });
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
  User build() {
    return User();
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
      User(name: 'Alice', email: 'alice@example.com'),
      User(name: 'Bob', email: 'bob@example.com'),
      User(name: 'Charlie', email: 'charlie123@gmail.com'),
    ];
  }

  addPropietario() {
    final user = User(name: "PEdro", email: "pedro@pedro");
    state = [...state, user];
  }
}
