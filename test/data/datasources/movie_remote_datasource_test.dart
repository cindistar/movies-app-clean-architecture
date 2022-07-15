import 'dart:convert';

import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/fixture_reader.dart';
import '../../models_fake/cast_crew_result_model_fake.dart';
import '../../models_fake/movie_detail_model_fake.dart';
import '../../models_fake/movie_result_model_fake.dart';
import '../../models_fake/video_result_model_fake.dart';


class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late MovieRemoteDataSourceImplementation dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = MovieRemoteDataSourceImplementation(client);
  });

  Map<String, dynamic> jsonReader(String name) {
    return json.decode(fixture(name));
  }

  void setUpMockHttpClientSuccess200(String urlExpected, Map<String, dynamic> json) {
    when(() => client.get(urlExpected)).thenAnswer((_) async => Response(
        statusCode: 200,
        data: json,
        requestOptions: RequestOptions(
          path: urlExpected,
        )));
  }

  void setUpMockHttpClientFailure404(String urlExpected, Map<String, dynamic> json) {
    when(() => client.get(urlExpected)).thenAnswer(((_) async => Response(
        data: json,
        statusCode: 404,
        requestOptions: RequestOptions(
          path: urlExpected,
        ))));
  }

  group('getTrendingMovies', () {
    const page = 1;
    const urlMovieTrending = '/trending/movie/day?&page=$page';
    test(
      'should call the (client) get method from correct urlMovieTrending',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieTrending, jsonReader('movie_result.json'));
        // act
        await dataSource.getTrendingMovies(page);
        // assert
        verify(() => client.get(urlMovieTrending)).called(1);
      },
    );
    test(
      '''should return a MovieResultsModel from method getTrendingMovies
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieTrending, jsonReader('movie_result.json'));
        // act
        final result = await dataSource.getTrendingMovies(page);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );
    test(
      '''should throw a ServerException from method getTrendingMovies
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieTrending, jsonReader('movie_result.json'));
        // act
        final result = dataSource.getTrendingMovies(page);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getNowPlayingMOvies', () {
    const page = 1;
    const urlMovieNowPlaying = '/movie/now_playing?&page=$page';

    test(
      'should call the (client) get method from correct urlMovieNowPlaying',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieNowPlaying, jsonReader('movie_result.json'));
        // act
        await dataSource.getNowPlayingMovies(page);
        // assert
        verify(() => client.get(urlMovieNowPlaying)).called(1);
      },
    );
    test(
      '''should return a MovieResultsModel from method getNowPlayingMovies
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieNowPlaying, jsonReader('movie_result.json'));
        // act
        final result = await dataSource.getNowPlayingMovies(page);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getNowPlayingMovies
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieNowPlaying, jsonReader('movie_result.json'));
        // act
        final result = dataSource.getNowPlayingMovies(page);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getPopularMovies', () {
    const page = 1;
    const urlMoviePopular = '/movie/popular?&page=$page';

    test(
      'should call the (client) get method from correct urlMoviePopular',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMoviePopular, jsonReader('movie_result.json'));
        // act
        await dataSource.getPopularMovies(page);
        // assert
        verify(() => client.get(urlMoviePopular)).called(1);
      },
    );

    test(
      '''should return a MovieResultsModel from method getPopularMovies
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMoviePopular, jsonReader('movie_result.json'));
        // act
        final result = await dataSource.getPopularMovies(page);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getPopularMovies
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMoviePopular, jsonReader('movie_result.json'));
        // act
        final result = dataSource.getPopularMovies(page);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getTopRatedMovies', () {
    const page = 1;
    const urlMovieTopRated = '/movie/top_rated?&page=$page';
    test(
      'should call the (client) get method from correct urlMovieTopRated',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieTopRated, jsonReader('movie_result.json'));
        // act
        await dataSource.getTopRatedMovies(page);
        // assert
        verify(() => client.get(urlMovieTopRated));
      },
    );

    test(
      '''should return a MovieResultsModel from method getTopRatedMovies
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieTopRated, jsonReader('movie_result.json'));
        // act
        final result = await dataSource.getTopRatedMovies(page);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getTopRatedMovies
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieTopRated, jsonReader('movie_result.json'));
        // act
        final result = dataSource.getTopRatedMovies(page);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getUpcomingMovies', () {
    const page = 1;
    const urlMovieUpcoming = '/movie/upcoming?&page=$page';

    test(
      'should call the (client) get method from correct urlMovieUpcoming',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieUpcoming, jsonReader('movie_result.json'));
        // act
        await dataSource.getUpcomingMovies(page);
        // assert
        verify(() => client.get(urlMovieUpcoming));
      },
    );

    test(
      '''should return a MovieResultsModel from method getUpcomingMovies
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieUpcoming, jsonReader('movie_result.json'));
        // act
        final result = await dataSource.getUpcomingMovies(page);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getUpcomingMovies
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieUpcoming, jsonReader('movie_result.json'));
        // act
        final result = dataSource.getUpcomingMovies(page);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getMoviesByGenre', () {
    int genreId = 2;
    final urlMovieByGenre = '/movie/popular?&with_genres=$genreId';

    test(
      'should call the (client) get method from correct urlMovieByGenre',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieByGenre, jsonReader('movie_result.json'));
        // act
        await dataSource.getMovieByGenre(genreId);
        // assert
        verify(() => client.get(urlMovieByGenre));
      },
    );

    test(
      '''should return a MovieResultsModel from method getMovieByGenre
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieByGenre, jsonReader('movie_result.json'));
        // act
        final result = await dataSource.getMovieByGenre(genreId);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getMovieByGenre
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieByGenre, jsonReader('movie_result.json'));
        // act
        final result = dataSource.getMovieByGenre(genreId);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getMovieDetail', () {
    int movieDetailId = 5;
    final urlMovieDetail = '/movie/$movieDetailId?';
    test(
      'should call the (client) get method from correct urlMovieDetail',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieDetail, jsonReader('movie_detail.json'));
        // act
        await dataSource.getMovieDetail(movieDetailId);
        // assert
        verify(() => client.get(urlMovieDetail));
      },
    );

    test(
      '''should return a MovieDetailModel from method getMovieDetail
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieDetail, jsonReader('movie_detail.json'));
        // act
        final result = await dataSource.getMovieDetail(movieDetailId);
        // assert
        expect(result, equals(movieDetailModel));
      },
    );

    test(
      '''should throw a ServerException from method getMovieDetail
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieDetail, jsonReader('movie_detail.json'));
        // act
        final result = dataSource.getMovieDetail(movieDetailId);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getCastCrew', () {
    int movieCastCrewId = 8;
    final urlMovieCastCrew = '/movie/$movieCastCrewId/credits?';
    test(
      'should call the (client) get method from correct urlMovieCastCrew',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieCastCrew, jsonReader('movie_cast_crew.json'));
        // act
        await dataSource.getCastCrew(movieCastCrewId);
        // assert
        verify(() => client.get(urlMovieCastCrew));
      },
    );

    test(
      '''should return a CastCrewResultModel from method getCastCrew
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieCastCrew, jsonReader('movie_cast_crew.json'));
        // act
        final result = await dataSource.getCastCrew(movieCastCrewId);
        // assert
        expect(result, equals(castCrewResultModel));
        //expect(result, isA<CastCrewResultModel>());
      },
    );

    test(
      '''should throw a ServerException from method getCastCrew
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieCastCrew, jsonReader('movie_cast_crew.json'));
        // act
        final result = dataSource.getCastCrew(movieCastCrewId);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getVideos', () {
    int videosId = 2;
    final urlMovieVideos = '/movie/$videosId/videos?';

    test(
      'should call the (client) get method from correct urlMovieVideos',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieVideos, jsonReader('movie_video.json'));
        // act
        await dataSource.getVideos(videosId);
        // assert
        verify(() => client.get(urlMovieVideos));
      },
    );

    test(
      '''should return a VideoResultModel from method getVideos
       when the response code is 200''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200(urlMovieVideos, jsonReader('movie_video.json'));
        // act
        final result = await dataSource.getVideos(videosId);
        // assert
        expect(result, equals(videoResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getVideos
       when the response code is 404''',
      () async {
        // arrange
        setUpMockHttpClientFailure404(urlMovieVideos, jsonReader('movie_video.json'));
        final result = dataSource.getVideos(videosId);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });

  group('getSearchedMovies', () {
    String searchText = 'query';
    final urlSearchedMovies = '/search/movie?&query=$searchText';

    test(
      'should call the (client) get method from correct urlSearchedMovies',
      () async {
        // arrange
        when(() => client.get(urlSearchedMovies, queryParameters: {'query': searchText})).thenAnswer((_) async =>
            Response(
                statusCode: 200,
                data: jsonReader('movie_result.json'),
                requestOptions: RequestOptions(path: urlSearchedMovies)));
        // act
        await dataSource.getSearchedMovies(searchText);
        // assert
        verify(() => client.get(urlSearchedMovies, queryParameters: {'query': searchText}));
      },
    );

    test(
      '''should return a MovieResultsModel from method getSearchedMovies 
      when the response code is 200''',
      () async {
        // arrange
        when(() => client.get(urlSearchedMovies, queryParameters: {'query': searchText})).thenAnswer((_) async =>
            Response(
                statusCode: 200,
                data: jsonReader('movie_result.json'),
                requestOptions: RequestOptions(path: urlSearchedMovies)));
        // act
        final result = await dataSource.getSearchedMovies(searchText);
        // assert
        expect(result, equals(moviesResultModel));
      },
    );

    test(
      '''should throw a ServerException from method getSearchedMovies 
      when the response code is 404''',
      () async {
        // arrange
        when(() => client.get(urlSearchedMovies, queryParameters: {'query': searchText}))
            .thenAnswer(((_) async => Response(
                data: jsonReader('movie_result.json'),
                statusCode: 404,
                requestOptions: RequestOptions(
                  path: urlSearchedMovies,
                ))));
        // act
        final result = dataSource.getSearchedMovies(searchText);
        // assert
        expect(() async => result, throwsA(const ServerException('Something went wrong!')));
      },
    );
  });
}
