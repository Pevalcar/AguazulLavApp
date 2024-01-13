
import 'package:aguazullavapp/lib.dart';

class GetJornadas {
  final JornadaRepository serviceInfoRepository;
  GetJornadas(this.serviceInfoRepository);
  Future<List<Jornada>> call() {
    return serviceInfoRepository.getJornadas();
  }
}