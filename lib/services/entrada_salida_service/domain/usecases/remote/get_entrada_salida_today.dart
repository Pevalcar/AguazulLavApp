import 'package:aguazullavapp/lib.dart';

class GetEntradaSalidaTodayRemote {
  final EntradaSalidaRepository serviceInfoRepository;
  GetEntradaSalidaTodayRemote(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call( List<String> ids) {
    return serviceInfoRepository.getEntradaSalidasInRange(ids);
  }
}
