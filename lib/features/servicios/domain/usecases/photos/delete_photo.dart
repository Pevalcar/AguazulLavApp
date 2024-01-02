
import 'package:aguazullavapp/lib.dart';
import 'package:image_picker/image_picker.dart';

class DeletePhoto {
  final PhotoDataRepository serviceInfoRepository;
  DeletePhoto(this.serviceInfoRepository);

  Future<void> call( XFile service) async {
    return serviceInfoRepository.deletePhoto( service);
  }
}