import 'package:aguazullavapp/lib.dart';

class ConfiguracionRepository {
  final ConfigsDataSource dataSource;
  ConfiguracionRepository(this.dataSource);
  Future<bool> update(ConfiguracionModel? data, String id) async {
    return await dataSource.updateConfiguraciones(data);
  }

  Future<ConfiguracionModel?> get(String id) async {
    return await dataSource.getConfiguraciones();
  }
}
