import 'dart:convert';

import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/data/datasources/genre_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';
import '../../models_fake/genre_model_fake.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late GenreRemoteDatasourceImplementation genreDataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    genreDataSource = GenreRemoteDatasourceImplementation(client);
  });

  Map<String, dynamic> jsonReader(String name) {
    return json.decode(fixture(name));
  }

  void successMock(String urlExpected, Map<String, dynamic> json) {
    when(() => client.get(urlExpected)).thenAnswer(
        (_) async => Response(statusCode: 200, data: json, requestOptions: RequestOptions(path: urlExpected)));
  }

  void failureMock(String urlExpected, Map<String, dynamic> json) {
    when(() => client.get(urlExpected)).thenAnswer(((_) async => Response(
        data: json,
        statusCode: 404,
        requestOptions: RequestOptions(
          path: urlExpected,
        ))));
  }

  group('getAllGenres', () {
    const urlMovieGenres = '/genre/movie/list';
    test(
      'should call the (client) get method from correct urlMovieGenres',
      () async {
        // arrange
        successMock(urlMovieGenres, jsonReader('genre.json'));
        // act
        await genreDataSource.getAllGenres();
        // assert
        verify(() => client.get(urlMovieGenres));
      },
    );

    test(
      'should return a GenreModel from method getAllGenres when the response code is 200',
      () async {
        // arrange
        successMock(urlMovieGenres, jsonReader('genre.json'));
        // act
        final result = await genreDataSource.getAllGenres();
        // assert
        expect(result, equals(genreModel));
      },
    );

    test(
      'should throw a ServerException from method getAllGenres when the response code is 404',
      () async {
        // arrange
        failureMock(urlMovieGenres, jsonReader('genre.json'));
        // act
        final result = genreDataSource.getAllGenres();
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });
}
