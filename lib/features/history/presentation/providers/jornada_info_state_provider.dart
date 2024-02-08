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
          serviciosList: vehicles,
          listaOrdenada:  await ordenarListVehiculos(vehicles),  
          );
      return jornadaInfo;
    });
      
    return jornadaInfo;
  }

  Future<List<List<Vehicle>>> ordenarListVehiculos(List<Vehicle> servicios) async {

      List<List<Vehicle>> list = [];
      List<String> empleados = [];
      if (servicios.isEmpty) {
        return list;
      }
      //Sacar empelados de los servicios
      for (var vehiculo in servicios) {
        if (!empleados.contains(vehiculo.trabjador)) {
          empleados.add(vehiculo.trabjador);
        }
      } 
      //separador de servicos por trabajador
      for (var emp in empleados) {
        List<Vehicle> listSPE = [];
        for (var vehiculo in servicios) {
          if (vehiculo.trabjador == emp) {
            listSPE.add(vehiculo);
          }
        }
        list.add(listSPE);
      }
      return list;
  }
}
