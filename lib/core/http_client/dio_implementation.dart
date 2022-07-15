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
            'api-key': 'd20a9f45fadf53b679cdb601f6f98125',
            'contentType': 'application/json; charset=utf-8',
            'language': 'en-US',
            'authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMjBhOWY0NWZhZGY1M2I2NzljZGI2MDFmNmY5ODEyNSIsInN1YiI6IjYxODk4YmRkMTYwZTczMDA2NzU0MmQ0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lc4T9V-qce-g841Nn2UN8nWVBPMF9EQzYYcUFNQuvlU'
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
