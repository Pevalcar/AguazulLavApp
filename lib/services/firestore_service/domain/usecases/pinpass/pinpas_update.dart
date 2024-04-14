import 'package:aguazullavapp/lib.dart';

class PinPassUpdate {
  final IFirestoreDatasourceService<int> datasource;
  PinPassUpdate(this.datasource);
  Future<bool> call(int? data, String id) {
    return datasource.update(data, id);
  }
}
