import 'package:aguazullavapp/lib.dart';

class DeleteEntradaSalidaRemote {
  final EntradaSalidaRepository serviceInfoRepository;
  DeleteEntradaSalidaRemote(this.serviceInfoRepository);
  Future<void> call(EntradaSalida entradaSalida, int index) {
    return serviceInfoRepository.deleteEntradaSalida(entradaSalida,index);
  }
}
