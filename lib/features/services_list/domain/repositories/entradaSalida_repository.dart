
import 'package:aguazullavapp/lib.dart';

abstract class EntradaSalidaRepository {
  Future<void> addEntradaSalida(EntradaSalida entradaSalida);
  Future<List<EntradaSalida>> getEntradaSalida();
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida);
  Future<List<EntradaSalida>> getEntradaSalidasInRange( List<String> ids);
}