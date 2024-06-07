abstract interface class Api<T> {
  Future<T> get({required String url, Map<String, dynamic>? headers});

  Future<T> post({required String url, T? data, Map<String, dynamic>? headers});
}
