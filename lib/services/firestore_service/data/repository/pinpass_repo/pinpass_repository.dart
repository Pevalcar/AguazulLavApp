import 'package:aguazullavapp/services/firestore_service/domain/repository/i_firebase_data_repository.dart';

import '../../datasource/pinpass_datasource/pinpass_datasource.dart';

class PinPassRepository extends IFirebasDataRepository<int> {
  final ConfigsDataSource dataSource;
  PinPassRepository(this.dataSource);
  @override
  Future<bool> update(int? data, String id) {
    return dataSource.update(data, id);
  }

  @override
  Future<int?> get(String id) {
    return dataSource.get(id);
  }

  @override
  Future<bool> add(int? data) => throw UnimplementedError();
  @override
  Future<bool> addAll(List<int?> data) => throw UnimplementedError();

  @override
  Future<List<int?>> getAll() => throw UnimplementedError();

  @override
  Future<List<int?>> getByIds(List<String> ids) => throw UnimplementedError();

  @override
  Future<bool> remove(String path) => throw UnimplementedError();
}
