import 'package:aguazullavapp/lib.dart';

class GetConfiguraciones {
  final ConfiguracionRepository repo;
  GetConfiguraciones(this.repo);
  Future<ConfiguracionModel?> call(String id) {
    return repo.get(id);
  }
}
