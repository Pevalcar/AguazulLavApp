import 'package:aguazullavapp/lib.dart';

class DeleteEntradaSalidaLocal {
  final EntradaSalidaLocalRepositoryImpl serviceInfoRepository;
  DeleteEntradaSalidaLocal(this.serviceInfoRepository);
  Future<void> call(EntradaSalida entradaSalida, int index) {
    return serviceInfoRepository.deleteEntradaSalida(entradaSalida,index);
  }
}
