import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class PhotoDataResource {
  final Reference _firestore;
  PhotoDataResource(this._firestore);
//TODO inteniar como subir mas ordenadamente las imagenes ejemplo por fecha año hora o algo asi
  Future<String> addPhoto(XFile photo) async {
    try {
      final upref = _firestore.child( "imagenes/${photo.name}");
      await upref.putFile(File(photo.path));
      return await upref.getDownloadURL();
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  Future<void> deletePhoto(XFile photo) async {
    try {
      final upref = _firestore.child("imagenes/${photo.name}");
      await upref.delete();
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
