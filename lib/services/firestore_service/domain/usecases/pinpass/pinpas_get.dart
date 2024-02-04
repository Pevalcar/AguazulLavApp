

import 'package:aguazullavapp/lib.dart';
import 'package:aguazullavapp/services/firestore_service/domain/repository/i_firebase_data_repository.dart';

class PinPassGet {
  final IFirebasDataRepository<int> repo;
  PinPassGet(this.repo);
  Future<int?> call(String id) {
    return repo.get(id);
  }

}
