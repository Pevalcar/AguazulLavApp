import 'dart:async';
import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PhotoDataResource {
  final Reference _firestore;
  PhotoDataResource(this._firestore);
//TODO inteniar como subir mas ordenadamente las imagenes ejemplo por fecha año hora o algo asi
  Future<PhotoState> addPhoto(XFile photo) async {
    try {
      final upref = _firestore.child("imagenes/${photo.name}");
      await upref.putFile(File(photo.path));
      final urle = await upref.getDownloadURL();
      return PhotoState(url: urle, photoName: photo.name, message: "La foto se subio con exito");
    } on FirebaseException catch (e) {
      return PhotoState(url: "" ,photoName: "", code: e.code, message: e.message);
    } catch (e) {
      return PhotoState(url: "",photoName: "", code: e.toString(), message: e.toString());
    }
  }

  Future<PhotoState> deletePhoto(String photo) async {
    try {
      final upref = _firestore.child("imagenes/$photo");
      await upref.delete();
      return const PhotoState(url: "",photoName: "", message: "La foto eliminada");
    } on FirebaseException catch (e) {
      logger.e("error Eliminar fotos" ,  stackTrace:  e.stackTrace, error: e.message);
      return PhotoState(url: "",photoName: "", code: e.code, message: e.message);
    } catch (e) {
      logger.e("error Eliminar fotos" , error: e.toString());
      return PhotoState(url: "",photoName: "", code: e.toString(), message: e.toString());
    }
  }
}
