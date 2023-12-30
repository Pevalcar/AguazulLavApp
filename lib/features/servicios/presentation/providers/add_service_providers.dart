import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "add_service_providers.g.dart";

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
  @override
  String? build() {
    return null;
  }

  void modifyPhoto(String photo) {
    state = photo;
  }

  void findPhotoCamera() async {
    state = await getFromCamera();
  }

  void findPhotoGallery() async {
    state = await getFromGallery();
  }

  getFromCamera() async {
    XFile? pickedFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 100,
    ) );
    if (pickedFile != null) {
      state = pickedFile.path;
    }
  }

  /// Get from gallery
  getFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality:  100,)
    ;
    if (image != null) {
      state = image.path;
    }
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
