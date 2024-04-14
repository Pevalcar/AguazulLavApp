import 'package:aguazullavapp/lib.dart';

class PinPassGet {
  final PinPassRepository repo;
  PinPassGet(this.repo);
  Future<int?> call(String id) {
    return repo.get(id);
  }
}
