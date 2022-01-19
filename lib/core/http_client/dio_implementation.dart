import 'package:app_example/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class DioHttpClientImplementation implements HttpClient {
  late Dio _dio;
  DioHttpClientImplementation() {
    try {
      _dio = Dio(
        BaseOptions(
          baseUrl: "https://api.themoviedb.org/3",
          headers: {
            'api-key': '',
            'contentType': 'application/json; charset=utf-8',
            'language': 'en-US',
            'authorization': 'Bearer '
          },
        ),
      );
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      url,
      queryParameters: queryParameters,
    );
  }
}
