import 'package:aguazullavapp/lib.dart';

class GetEntradasSalidasRemote {
  final EntradaSalidaRepository serviceInfoRepository;
  GetEntradasSalidasRemote(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call() {
    return serviceInfoRepository.getEntradaSalida();
  }
}
