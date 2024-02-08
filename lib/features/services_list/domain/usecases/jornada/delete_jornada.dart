
import 'package:aguazullavapp/lib.dart';

class  DeleteJornada {
  final JornadaRepository serviceInfoRepository;
  DeleteJornada(this.serviceInfoRepository);
  Future<void> call(Jornada jornada) async {
    return serviceInfoRepository.deleteJornada(jornada);
  }
}