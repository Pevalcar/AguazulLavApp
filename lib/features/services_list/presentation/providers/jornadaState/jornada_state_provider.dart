import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part "jornada_state_provider.g.dart";

//TODO hacer funcinar apartir de aqui el estado de la jornada
@riverpod
class JornadaState extends _$JornadaState {
  @override
  FutureOr<Jornada?> build() {
    return null;
  }

  void iniciarJornada(int cajaicial) {
    state = AsyncValue.data(Jornada(
      id: const Uuid().v4(),
      dateInit: DateTime.now(),
      cajaInicial: cajaicial,
    ));
  }
}
