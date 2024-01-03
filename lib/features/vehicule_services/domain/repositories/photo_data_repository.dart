import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

abstract class PhotoDataRepository {
  Future<PhotoState> addPhoto(XFile photo);
  Future<PhotoState> deletePhoto(XFile service);
}
