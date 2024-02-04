import 'package:aguazullavapp/lib.dart';

class GetEntradaSalidaTodayRemote {
  final EntradaSalidaRemoteRepositoryImpl serviceInfoRepository;
  GetEntradaSalidaTodayRemote(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call( List<String> ids) {
    return serviceInfoRepository.getEntradaSalidasInRange(ids);
  }
}
