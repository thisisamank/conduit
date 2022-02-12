abstract class BaseStorage<T> {
  Future<T?> read();
  Future<void> save(T data);
  Future<void> clear();
}
