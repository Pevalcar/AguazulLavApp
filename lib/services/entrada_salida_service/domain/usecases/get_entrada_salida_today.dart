import 'package:aguazullavapp/lib.dart';

class GetEntradaSalidaToday {
  final EntradaSalidaRepository serviceInfoRepository;
  GetEntradaSalidaToday(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call( List<String> ids) {
    return serviceInfoRepository.getEntradaSalidasInRange(ids);
  }
}
