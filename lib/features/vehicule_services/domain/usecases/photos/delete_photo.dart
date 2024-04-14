import 'package:aguazullavapp/lib.dart';

class DeletePhoto {
  final PhotoDataRepositoryImpl serviceInfoRepository;
  DeletePhoto(this.serviceInfoRepository);

  Future<PhotoState> call(String service, DateTime time) async {
    return serviceInfoRepository.deletePhoto(service, time);
  }
}
