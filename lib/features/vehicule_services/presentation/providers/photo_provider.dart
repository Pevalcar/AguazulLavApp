import 'package:aguazullavapp/lib.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_provider.g.dart';

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

//Crear e impleemntar una base de datos estatica para subir archivos cuando tenga conexion
//provider photo
@riverpod
class PhotoVehicule extends _$PhotoVehicule {
  XFile? _temp;
  @override
  FutureOr<PhotoState?> build() {
    return null;
  }

  void modifyPhoto(String photo) async {
    state = AsyncValue.data(PhotoState(url: photo));
  }

  void uploadPhoto(XFile photo) async {
    _temp = photo;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final statefinal = await ref.read(addPhotoGrafieProvider).call(photo);
      debugPrint('statefinal: $statefinal');
      return statefinal;
    });
  }

  void deletePhoto(Function()? callback) async {
    if (_temp == null) {
      callback!();
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final statefinal = await ref.read(deletePhotoGrafieProvider).call(_temp!);
      debugPrint('statefinal: $statefinal');
      if (callback != null) {
        callback();
      }
      return statefinal;
    });
  }
}
