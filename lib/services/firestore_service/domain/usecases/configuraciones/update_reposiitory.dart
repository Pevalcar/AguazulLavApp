import 'package:aguazullavapp/lib.dart';

class UpdateConfiguraciones {
  final ConfiguracionRepository repo;
  UpdateConfiguraciones(this.repo);
  Future<bool?> call(ConfiguracionModel id) {
    return repo.update(id, "");
  }
}
