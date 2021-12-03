import 'package:dio/dio.dart';

class CustomDio {
  Dio dio() {
    try {
      return Dio(
        BaseOptions(
          baseUrl: "https://api.themoviedb.org/3",
          headers: {
            'api-key': 'api_key=d20a9f45fadf53b679cdb601f6f98125',
            'contentType': 'application/json; charset=utf-8',
            'language': 'en-US',
            'authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMjBhOWY0NWZhZGY1M2I2NzljZGI2MDFmNmY5ODEyNSIsInN1YiI6IjYxODk4YmRkMTYwZTczMDA2NzU0MmQ0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lc4T9V-qce-g841Nn2UN8nWVBPMF9EQzYYcUFNQuvlU'
          },
        ),
      );
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
