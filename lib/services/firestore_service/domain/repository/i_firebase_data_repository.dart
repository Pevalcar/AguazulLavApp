abstract class IFirebasDataRepository<T> {
  Future<List<T?>> getAll();
  Future<T?> get(String id);
  Future<List<T?>> getByIds(List<String> ids);
  Future<bool> add(T? data);
  Future<bool> update(T? data, String id);
  Future<bool> remove(String path);
  Future<bool> addAll(List<T?> data);
}
