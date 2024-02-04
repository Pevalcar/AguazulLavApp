import 'package:aguazullavapp/lib.dart';

abstract class IEntradaSalidaDataSource  {
  Future<List<EntradaSalida>> getEntradaSalidas();
  Future<List<EntradaSalida>> getEntradaSalidasInRange(List<String> ids);
  Future<void> addEntradaSalida(EntradaSalida entradaSalida);
  Future<void> deleteEntradaSalida(EntradaSalida entradaSalida);
}