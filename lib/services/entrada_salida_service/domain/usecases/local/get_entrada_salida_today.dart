import 'package:aguazullavapp/lib.dart';

class GetEntradaSalidaTodayLocal {
  final EntradaSalidaLocalRepositoryImpl serviceInfoRepository;
  GetEntradaSalidaTodayLocal(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call( List<String> ids) {
    return serviceInfoRepository.getEntradaSalidasInRange(ids);
  }
}
