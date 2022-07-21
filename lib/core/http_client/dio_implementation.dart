import 'package:app_example/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class DioHttpClientImplementation implements HttpClient {
  final Dio dio;
  DioHttpClientImplementation(this.dio);

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get<T>(
      url,
      queryParameters: queryParameters,
    );
  }
}
