import 'package:aguazullavapp/lib.dart';

class GetEntradasSalidas {
  final EntradaSalidaRepository serviceInfoRepository;
  GetEntradasSalidas(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call() {
    return serviceInfoRepository.getEntradaSalida();
  }
}
