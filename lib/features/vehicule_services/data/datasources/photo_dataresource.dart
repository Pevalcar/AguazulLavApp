import 'dart:async';
import 'dart:io';
import 'package:aguazullavapp/lib.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PhotoDataResource {
  final Reference _firestore;
  PhotoDataResource(this._firestore);
  Future<PhotoState> addPhoto(XFile photo) async {
    String fecha = DateFormat("yyyy_MM_dd").format(await photo.lastModified());
    try {
      final upref = _firestore.child("imagenes/$fecha/${photo.name}");
      await upref.putFile(File(photo.path));
      final urle = await upref.getDownloadURL();
      return PhotoState(
          url: urle,
          photoName: photo.name,
          message: "La foto se subio con exito");
    } on FirebaseException catch (e) {
      return PhotoState(
          url: "", photoName: "", code: e.code, message: e.message);
    } catch (e) {
      return PhotoState(
          url: "", photoName: "", code: e.toString(), message: e.toString());
    }
  }

  Future<PhotoState> deletePhoto(String photo, DateTime time) async {
    String _time = DateFormat("yyyy_MM_dd").format(time);
    try {
      final upref = _firestore.child("imagenes/$_time/$photo");
      await upref.delete();
      logger.i("Eliminado correctamente la foto $photo");
      return const PhotoState(
          url: "", photoName: "", message: "La foto eliminada");
    } on FirebaseException catch (e) {
      logger.e("error Eliminar fotos",
          stackTrace: e.stackTrace, error: e.message);
      return PhotoState(
          url: "", photoName: "", code: e.code, message: e.message);
    } catch (e) {
      logger.e("error Eliminar fotos", error: e.toString());
      return PhotoState(
          url: "", photoName: "", code: e.toString(), message: e.toString());
    }
  }
}
