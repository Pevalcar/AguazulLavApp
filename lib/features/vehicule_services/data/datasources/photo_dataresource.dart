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
      return PhotoState(url: urle, message: "La foto se subio con exito");
    } on FirebaseException catch (e) {
      return PhotoState(url: null, code: e.code, message: e.message);
    } catch (e) {
      return PhotoState(url: null, code: e.toString(), message: e.toString());
    }
  }

  Future<PhotoState> deletePhoto(XFile photo) async {
    try {
      final upref = _firestore.child("imagenes/${photo.name}");
      await upref.delete();
      return const PhotoState(url: null, message: "La foto eliminada");
    } on FirebaseException catch (e) {
      return PhotoState(url: null, code: e.code, message: e.message);
    } catch (e) {
      return PhotoState(url: null, code: e.toString(), message: e.toString());
    }
  }
}
