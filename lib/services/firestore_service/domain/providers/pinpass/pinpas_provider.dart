import 'package:aguazullavapp/lib.dart';
import 'package:aguazullavapp/services/firestore_service/data/datasource/pinpass_datasource/pinpass_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pinpas_provider.g.dart';

//datasource
@riverpod
PinPasDataSource pinpassDataSource(PinpassDataSourceRef ref) {
  final firebase = ref.watch(firestoreServiceProvider).collection(COLECTION_CONTROLLERS_NAME);
  return PinPasDataSource(firebase);
}

//repo
@riverpod
PinPassRepository pinpassRepository(PinpassRepositoryRef ref) {
  final dataSource = ref.watch(pinpassDataSourceProvider);
  return PinPassRepository( dataSource);
}

@riverpod
PinPassGet pinpassGet(PinpassGetRef ref) {
  final repository = ref.watch(pinpassRepositoryProvider);
  return PinPassGet( repository);
}

@riverpod
PinPassUpdate pinpassUpdate(PinpassUpdateRef ref) {
  final datasource = ref.watch(pinpassDataSourceProvider);
  return PinPassUpdate(datasource);
}
@riverpod
class PinPass extends _$PinPass {
  @override
  Future<int?> build() async {
    return _featchPin();
  }

  Future<int?> _featchPin() async {
    return await ref.read(pinpassGetProvider).call("pass");
  }

  void setPin(int value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(pinpassUpdateProvider).call(value);
      return value;
    });
  }
}
