
 import 'package:aguazullavapp/lib.dart';

class EditJornada {
  final JornadaRepository repository;

  EditJornada(this.repository);
  Future<void> call(Jornada jornada) async {
    return await repository.editJornada(jornada);
  }

}