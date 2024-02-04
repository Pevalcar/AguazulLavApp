import 'package:aguazullavapp/lib.dart';

class GetEntradasSalidasLocal {
  final EntradaSalidaLocalRepositoryImpl serviceInfoRepository;
  GetEntradasSalidasLocal(this.serviceInfoRepository);
  Future<List<EntradaSalida>> call() {
    return serviceInfoRepository.getEntradaSalida();
  }
}
