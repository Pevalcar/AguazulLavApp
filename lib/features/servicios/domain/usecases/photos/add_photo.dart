
import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto {
  final PhotoDataRepository serviceInfoRepository;
  AddPhoto(this.serviceInfoRepository);

  Future<String> call( XFile service) async {
    return serviceInfoRepository.addPhoto( service);
  }
}