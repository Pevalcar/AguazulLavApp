

import 'package:aguazullavapp/lib.dart';

class AddEntradaSalida {
  final EntradaSalidaRepository serviceInfoRepository;
  AddEntradaSalida(this.serviceInfoRepository);
  Future<void> call(EntradaSalida entradaSalida){
    return serviceInfoRepository.addEntradaSalida(entradaSalida);
  }

}