import 'package:aguazullavapp/lib.dart';

abstract class JornadaRepository {
  Future<Jornada?> addJornada(Jornada jornada);
  Future<void> deleteJornada(Jornada jornada);
  Future<List<Jornada>> getJornadas();
  Future<void> editJornada(Jornada jornada);
  Future<Jornada?> getCurrentJornada();
}