

import 'package:aguazullavapp/lib.dart';

class AddJornada {
  final JornadaRepository serviceInfoRepository;
  AddJornada(this.serviceInfoRepository);
  Future<Jornada?> call(Jornada jornada) async {
    return serviceInfoRepository.addJornada(jornada);
  }
}

