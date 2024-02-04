import 'package:aguazullavapp/lib.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrada_salida_local_repo.g.dart';

@riverpod
EntradaSalidaLocalDataSource entradaSalidaLocalDataSource(
    EntradaSalidaLocalDataSourceRef ref) {
  final Box<EntradaSalidaModel> localDataSource =
      Hive.box(COLECTION_ENTRADSALIDA_NAME);
  return EntradaSalidaLocalDataSource(localDataSource);
}

@riverpod
EntradaSalidaLocalRepositoryImpl entradaSalidaLocalRepository(
    EntradaSalidaLocalRepositoryRef ref) {
  final local = ref.watch(entradaSalidaLocalDataSourceProvider);
  return EntradaSalidaLocalRepositoryImpl(local);
}
@riverpod
GetEntradasSalidasLocal getEntradaSalida(GetEntradaSalidaRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository =
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return GetEntradasSalidasLocal(repository);
}

@riverpod
AddEntradaSalidaLocal addEntradaSalida(AddEntradaSalidaRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository =
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return AddEntradaSalidaLocal(repository);
}

@riverpod
DeleteEntradaSalidaLocal deleteEntradaSalida(DeleteEntradaSalidaRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository =
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return DeleteEntradaSalidaLocal(repository);
}

@riverpod 
ClearEntradaSalidaLocal clearEntradaSalida(ClearEntradaSalidaRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository = 
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return ClearEntradaSalidaLocal(repository);
}
