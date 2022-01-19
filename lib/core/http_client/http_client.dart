import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}
