

import 'package:aguazullavapp/lib.dart';

class AddEntradaSalidaLocal {
  final EntradaSalidaLocalRepositoryImpl serviceInfoRepository;
  AddEntradaSalidaLocal(this.serviceInfoRepository);
  Future<void> call(EntradaSalida entradaSalida){
    return serviceInfoRepository.addEntradaSalida(entradaSalida);
  }

}