// ignore_for_file: file_names

import 'package:aguazullavapp/lib.dart';

class GetCurrentJornada {
  final JornadaRepository repository;

  GetCurrentJornada(this.repository);
  Future<Jornada?> call() async {
    return await repository.getCurrentJornada();
  }
}
