import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

class PhotoDataRepositoryImpl implements PhotoDataRepository {
  final PhotoDataResource _localDataSource;
  PhotoDataRepositoryImpl(this._localDataSource);

  @override
  Future<PhotoState> addPhoto(XFile photo) async {
    return _localDataSource.addPhoto(photo);
  }

  @override
  Future<PhotoState> deletePhoto(String service, DateTime time) async {
    return _localDataSource.deletePhoto(service, time);
  }
}
