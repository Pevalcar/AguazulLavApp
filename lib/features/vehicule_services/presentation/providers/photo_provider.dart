// ignore_for_file: non_constant_identifier_names

import 'package:aguazullavapp/lib.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  @override
  FutureOr<PhotoState?> build() {
    return null;
  }

  void modifyPhoto(String url, String photoname) async {
    state = AsyncValue.data(PhotoState(url: url, photoName: photoname));
  }

  void uploadPhoto(XFile photo) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final statefinal = await ref.read(addPhotoGrafieProvider).call(photo);
      return statefinal;
    });
  }

  Future<void> deletePhoto(
      String? photo, DateTime time, Function()? callback) async {
    if (photo == null ||
        photo == "" ||
        photo.contains(
            "https://firebasestorage.googleapis.com/v0/b/aguazullavapp.appspot.com/o/prueba.png")) {
      return callback!();
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(deletePhotoGrafieProvider).call(photo, time);
      if (callback != null) {
        callback();
      }
      return null;
    });
  }
}
