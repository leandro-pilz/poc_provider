abstract interface class Api<T> {
  Future<T> get();

  Future<T> post({T? data});
}
