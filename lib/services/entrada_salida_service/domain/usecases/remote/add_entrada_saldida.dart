

import 'package:aguazullavapp/lib.dart';

class AddEntradaSalidaRemote {
  final EntradaSalidaRepository serviceInfoRepository;
  AddEntradaSalidaRemote(this.serviceInfoRepository);
  Future<void> call(EntradaSalida entradaSalida){
    return serviceInfoRepository.addEntradaSalida(entradaSalida);
  }

}