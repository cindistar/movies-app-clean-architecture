import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/models/movie_model.dart';
import 'package:app_example/data/models/movie_results_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late IMovieRemoteDataSource dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = MovieRemoteDataSourceImplementation(client);
  });

  int page = 1;

  final movieJson = {
    "page": page,
    "results": <MovieModel>[],
    "total_pages": 10,
    "total_results": 10,
  };

  final urlExpected = '/movie/now_playing?&page=$page';

  void successMock() {
    when(() => client.get(urlExpected)).thenAnswer((_) async => Response(
        statusCode: 200,
        data: movieJson,
        requestOptions: RequestOptions(path: urlExpected)));
  }

  test(
    'should call the get method with correct url',
    () async {
      // arrange
      successMock();
      // act
      await dataSource.getNowPlayingMovies(page);
      // assert
      verify(() => client.get(urlExpected)).called(1);
    },
  );
  test(
    'should return a MovieResultsModel when the response code is 200',
    () async {
      // arrange
      const moviesResultModel = MovieResultsModel(
        page: 1,
        results: <MovieModel>[],
        totalPages: 10,
        totalResults: 10,
      );

      successMock();
      // act
      final result = await dataSource.getNowPlayingMovies(page);
      // assert
      expect(result, equals(moviesResultModel));
    },
  );

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      // arrange

      when(() => client.get(urlExpected)).thenAnswer(((_) async => Response(
          data: movieJson,
          statusCode: 404,
          requestOptions: RequestOptions(
            path: urlExpected,
          ))));

      // act
      final result = dataSource.getNowPlayingMovies(page);
      // assert
      expect(() async => result,
          throwsA(const ServerException('Something went wrong!')));
    },
  );
}
