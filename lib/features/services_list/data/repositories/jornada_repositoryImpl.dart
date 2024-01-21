import 'package:aguazullavapp/lib.dart';

class JornadaRepositoryImpl implements JornadaRepository {
  final JornadaDataSource dataSource;
  JornadaRepositoryImpl(this.dataSource);
  @override
  Future<Jornada?> addJornada(Jornada jornada) {
    return dataSource.addJornada(jornada);
  }

  @override
  Future<void> deleteJornada(Jornada jornada) {
    return dataSource.deleteJornada(jornada);
  }

  @override
  Future<List<Jornada>> getJornadas() {
    return dataSource.getJornadas();
  }

  @override
  Future<void> editJornada(Jornada jornada) {
    return dataSource.editJornada(jornada);
  }
  
  @override
  Future<Jornada?> getCurrentJornada() {
    return dataSource.getCurrentJornada();
  }
}
