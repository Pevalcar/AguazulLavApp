import 'package:aguazullavapp/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entrada_salida_remote_repo.g.dart';

@riverpod
EntradaSalidaRemoteDataSource entradaSalidaDataSource(
    EntradaSalidaDataSourceRef ref) {
  final localDataSource =
      FirebaseFirestore.instance.collection(COLLECTION_ENTRADSALIDA_NAME);
  return EntradaSalidaRemoteDataSource(localDataSource);
}

@riverpod
EntradaSalidaRemoteRepositoryImpl entradaSalidaRepository(
    EntradaSalidaRepositoryRef ref) {
  final remote = ref.watch(entradaSalidaDataSourceProvider);
  return EntradaSalidaRemoteRepositoryImpl(remote);
}

@riverpod
GetEntradaSalidaTodayRemote getEntradaSalidaToday(GetEntradaSalidaTodayRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return GetEntradaSalidaTodayRemote(repository);
}

@riverpod
GetEntradasSalidasRemote getEntradaSalida(GetEntradaSalidaRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return GetEntradasSalidasRemote(repository);
}

@riverpod
AddEntradaSalidaRemote addEntradaSalida(AddEntradaSalidaRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return AddEntradaSalidaRemote(repository);
}

@riverpod
DeleteEntradaSalidaRemote deleteEntradaSalida(DeleteEntradaSalidaRef ref) {
  final repository = ref.watch(entradaSalidaRepositoryProvider);
  return DeleteEntradaSalidaRemote(repository);
}