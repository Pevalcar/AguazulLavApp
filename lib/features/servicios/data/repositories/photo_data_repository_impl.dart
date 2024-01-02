import 'package:aguazullavapp/features/servicios/data/datasources/photo_dataresource.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

class PhotoDataRepositoryImpl implements PhotoDataRepository {
  final PhotoDataResource _localDataSource;
  PhotoDataRepositoryImpl(this._localDataSource);

  @override
  Future<String> addPhoto(XFile photo) async {
    return _localDataSource.addPhoto(photo);
  }

  @override
  Future<void> deletePhoto(XFile service) async {
    _localDataSource.deletePhoto(service);
  }
}
