import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

abstract class PhotoDataRepository {
  Future<String> addPhoto(XFile photo);
  Future<void> deletePhoto(XFile service);
}
