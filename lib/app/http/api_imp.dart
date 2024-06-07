import 'package:dio/dio.dart';
import 'package:poc_provider/core/http/api.dart';

final class ApiImp implements Api {
  final Dio _dio;

  ApiImp({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>?> get({required String url, Map<String, dynamic>? headers}) async {
    final response = await _dio.get(url, queryParameters: headers);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>?> post({required String url, data, Map<String, dynamic>? headers}) async {
    final response = await _dio.post(url, data: data, queryParameters: headers);
    return response.data;
  }
}
