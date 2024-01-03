
import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto {
  final PhotoDataRepository serviceInfoRepository;
  AddPhoto(this.serviceInfoRepository);

  Future<PhotoState> call( XFile service) async {
    return serviceInfoRepository.addPhoto( service);
  }
}