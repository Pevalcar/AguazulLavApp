import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../lib.dart';

part 'pinpas_provider.g.dart';

//datasource
@riverpod
ConfigsDataSource configsDataSource(ConfigsDataSourceRef ref) {
  final firebase = ref
      .watch(firestoreServiceProvider)
      .collection(COLLECTION_CONTROLLERS_NAME);
  return ConfigsDataSource(firebase);
}

//repo
@riverpod
PinPassRepository pinpassRepository(PinpassRepositoryRef ref) {
  final dataSource = ref.watch(configsDataSourceProvider);
  return PinPassRepository(dataSource);
}

@riverpod
PinPassGet pinpassGet(PinpassGetRef ref) {
  final repository = ref.watch(pinpassRepositoryProvider);
  return PinPassGet(repository);
}

@riverpod
PinPassUpdate pinpassUpdate(PinpassUpdateRef ref) {
  final datasource = ref.watch(configsDataSourceProvider);
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
      await ref.read(pinpassUpdateProvider).call(value, "pass");
      return value;
    });
  }
}

@riverpod
class Comicion extends _$Comicion {
  @override
  Future<int?> build() async {
    return _featchPin();
  }

  static const String title = 'comicion';

  Future<int?> _featchPin() async {
    return await ref.read(pinpassGetProvider).call(title);
  }

  void setPin(int value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(pinpassUpdateProvider).call(value, title);
      return value;
    });
  }
}
