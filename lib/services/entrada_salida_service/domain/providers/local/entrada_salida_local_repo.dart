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
GetEntradasSalidasLocal getEntradaSalidaLocal(GetEntradaSalidaLocalRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository =
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return GetEntradasSalidasLocal(repository);
}

@riverpod
AddEntradaSalidaLocal addEntradaSalidaLocal(AddEntradaSalidaLocalRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository =
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return AddEntradaSalidaLocal(repository);
}

@riverpod
DeleteEntradaSalidaLocal deleteEntradaSalidaLocal(DeleteEntradaSalidaLocalRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository =
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return DeleteEntradaSalidaLocal(repository);
}

@riverpod 
ClearEntradaSalidaLocal clearEntradaSalidaLocal(ClearEntradaSalidaLocalRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository = 
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return ClearEntradaSalidaLocal(repository);
}

@riverpod
SetListEntradaSalidaLocal setListEntradaSalidaLocal(SetListEntradaSalidaLocalRef ref) {
  final EntradaSalidaLocalRepositoryImpl repository = 
      ref.watch(entradaSalidaLocalRepositoryProvider);
  return SetListEntradaSalidaLocal(repository);
}
