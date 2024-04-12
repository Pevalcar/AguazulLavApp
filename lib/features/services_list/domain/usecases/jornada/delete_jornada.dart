import 'package:aguazullavapp/lib.dart';

class DeleteJornada {
  final JornadaRepositoryImpl serviceInfoRepository;
  DeleteJornada(this.serviceInfoRepository);
  Future<void> call(Jornada jornada) async {
    return serviceInfoRepository.deleteJornada(jornada);
  }
}
