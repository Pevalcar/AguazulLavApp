import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "jornada_info_state_provider.g.dart";

//TODO Agregar visibiliti witget a laspartesque requieran logica de visibilidad
@riverpod
class JornadaInfo extends _$JornadaInfo {
  @override
  FutureOr<JornadaInfoModel?> build(Jornada? jornada) {
    return getJornadaInfo(jornada);
  }

  Future<JornadaInfoModel?> getJornadaInfo(Jornada? jornada) async {
    if (jornada == null) return null;
    JornadaInfoModel? jornadaInfo;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      List<Vehicle> vehicles = [];
      List<EntradaSalida> entradasalidas = [];

      if (jornada.jornadasListIDs.isNotEmpty) {
        vehicles = await ref
            .read(getVehiculesTodayProvider)
            .call(jornada.jornadasListIDs);
      }
      if (jornada.entradaSalidaIDs.isNotEmpty) {
        entradasalidas = await ref
            .read(getEntradaSalidaTodayProvider)
            .call(jornada.entradaSalidaIDs);
      }
      jornadaInfo = JornadaInfoModel(
          jornada: jornada,
          entradaSalidasList: entradasalidas,
          serviciosList: vehicles);
      return jornadaInfo;
    });
    return jornadaInfo;
  }
}
