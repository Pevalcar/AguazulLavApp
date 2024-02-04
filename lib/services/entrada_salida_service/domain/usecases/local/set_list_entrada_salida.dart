import 'package:aguazullavapp/lib.dart';

class SetListEntradaSalidaLocal {
  final EntradaSalidaLocalRepositoryImpl serviceInfoRepository;
  SetListEntradaSalidaLocal(this.serviceInfoRepository);
  Future<void> call(List<EntradaSalida> list) async {
    return serviceInfoRepository.updateEntradaSalidas(list);
  }
}