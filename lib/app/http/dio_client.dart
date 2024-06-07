import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  Dio get dio => _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      ),
    );
  }
}
