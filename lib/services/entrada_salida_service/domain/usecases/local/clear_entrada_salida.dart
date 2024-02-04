import 'package:aguazullavapp/lib.dart';

class ClearEntradaSalidaLocal {
  final EntradaSalidaLocalRepositoryImpl entradaSalidaLocalDataSource;

  ClearEntradaSalidaLocal(this.entradaSalidaLocalDataSource);

  Future<void> call() async {
    await entradaSalidaLocalDataSource.clearLocal();
  }
}
