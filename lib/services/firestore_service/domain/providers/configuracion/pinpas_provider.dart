import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
ConfiguracionRepository configuracionrRepositorye(
    ConfiguracionrRepositoryeRef ref) {
  final dataSource = ref.watch(configsDataSourceProvider);
  return ConfiguracionRepository(dataSource);
}

@riverpod
PinPassGet pinpassGet(PinpassGetRef ref) {
  final repository = ref.watch(pinpassRepositoryProvider);
  return PinPassGet(repository);
}

@riverpod
PinPassUpdate pinpassUpdate(PinpassUpdateRef ref) {
  final datasource = ref.watch(pinpassRepositoryProvider);
  return PinPassUpdate(datasource);
}

@riverpod
GetConfiguraciones configsGet(ConfigsGetRef ref) {
  final repository = ref.watch(configuracionrRepositoryeProvider);
  return GetConfiguraciones(repository);
}

@riverpod
UpdateConfiguraciones configsUpdate(ConfigsUpdateRef ref) {
  final datasource = ref.watch(configuracionrRepositoryeProvider);
  return UpdateConfiguraciones(datasource);
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
    return _featchComicion();
  }

  static const String title = 'comicion';

  Future<int?> _featchComicion() async {
    return await ref.read(pinpassGetProvider).call(title);
  }

  void setComicion(int value) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(pinpassUpdateProvider).call(value, title);
      return value;
    });
  }
}

@riverpod
class Configuraciones extends _$Configuraciones {
  @override
  FutureOr<ConfiguracionModel?> build() {
    return _featchConfiguraciones();
  }

  Future<ConfiguracionModel?> _featchConfiguraciones() async {
    final result = await ref.read(configsGetProvider).call("configuraciones");
    if (result != null) {
      state = AsyncValue.data(result);
    } else {
      state = const AsyncValue.data(ConfiguracionModel(
          nameEmpresa: "nameEmpresa",
          lema: "lema",
          correo: "correo",
          direccion: "direccion",
          phone: "phone"));
    }
    return result;
  }

  void setConfiguraciones(ConfiguracionModel? value) async {
    if (value == null) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(configsUpdateProvider).call(value);
      return value;
    });
  }
}
