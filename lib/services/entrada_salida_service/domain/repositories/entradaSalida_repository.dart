
import 'package:aguazullavapp/lib.dart';

abstract class EntradaSalidaRepository {
  Future<List<EntradaSalida>> getEntradaSalida();
  Future<List<EntradaSalida>> getEntradaSalidasInRange( List<String> ids);
  Future<void> addEntradaSalida(EntradaSalida entradaSalida);
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida,int index);
  Future<void> updateEntradaSalidas(List<EntradaSalida> entradaSalidas);
  Future<void> clearLocal();
}