import 'package:aguazullavapp/lib.dart';

class DeleteEntradaSalida {
  final EntradaSalidaRepository serviceInfoRepository;
  DeleteEntradaSalida(this.serviceInfoRepository);
  Future<void> call(EntradaSalida entradaSalida) {
    return serviceInfoRepository.deleteEntradaSalida(entradaSalida);
  }
}
