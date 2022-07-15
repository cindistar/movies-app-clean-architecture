import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/models/cast_crew_result_model.dart';
import 'package:app_example/data/models/movie_detail_model.dart';
import 'package:app_example/data/models/movie_results_model.dart';
import 'package:app_example/data/models/video_result_model.dart';
import 'package:app_example/data/repositories/movie_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRemoteDatasource extends Mock implements IMovieRemoteDataSource {}

void main() {
  late MovieRepositoryImplementation repository;
  late IMovieRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockMovieRemoteDatasource();
    repository = MovieRepositoryImplementation(dataSource);
  });

  const page = 1;

  const id = 10;

  const genreId = 5;

  var movieResultsModel = MovieResultsModel(
    page: page,
    results: const [],
    totalPages: 0,
    totalResults: 0,
  );

  test(
    'should return a MovieResultsModel when the method getNowPlayingMovies calls the datasource',
    () async {
      // arrange
      when(() => dataSource.getNowPlayingMovies(page)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getNowPlayingMovies(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getNowPlayingMovies unsuccessful the call to the datasource',
    () async {
      // arrange
      when(() => dataSource.getNowPlayingMovies(page)).thenThrow(const ServerException('Server failure!'));
      // act
      final result = await repository.getNowPlayingMovies(page);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getPopularMovies calls the datasource',
    () async {
      // arrange
      when(() => dataSource.getPopularMovies(page)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getPopularMovies(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getPopularMovies call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getPopularMovies(page)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getPopularMovies(page);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getTopRatedMovies calls the datasource',
    () async {
      // arrange
      when(() => dataSource.getTopRatedMovies(page)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getTopRatedMovies(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getTopRatedMovies call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getTopRatedMovies(page)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getTopRatedMovies(page);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getTrendingMovies calls the datasource',
    () async {
      // arrange
      when(() => dataSource.getTrendingMovies(page)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getTrendingMovies(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getTrendingMovies call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getTrendingMovies(page)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getTrendingMovies(page);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getUpcomingMovies calls the datasource',
    () async {
      // arrange
      when(() => dataSource.getUpcomingMovies(page)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getUpcomingMovies(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getUpcomingMovies call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getUpcomingMovies(page)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getUpcomingMovies(page);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getMovieByGenre calls the datasource',
    () async {
      // arrange
      when(() => dataSource.getMovieByGenre(genreId)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getMovieByGenre(genreId);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getMovieByGenre call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getMovieByGenre(genreId)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getMovieByGenre(genreId);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getMovieDetail calls the datasource',
    () async {
      final movieDetailModel = MovieDetailModel(
        adult: true,
        backdropPath: '',
        belongsToCollection: null,
        budget: 3000000,
        genres: const [],
        homepage: '',
        id: 876,
        imdbId: '',
        originalLanguage: '',
        originalTitle: '',
        overview: '',
        popularity: 7.9,
        productionCompanies: const [],
        revenue: 8000000,
        productionCountries: const [],
        runtime: 97,
        spokenLanguages: const [],
        status: '',
        tagline: '',
        title: '',
        video: false,
        voteAverage: 4.4,
        voteCount: 2,
      );
      // arrange
      when(() => dataSource.getMovieDetail(id)).thenAnswer((_) async => movieDetailModel);
      // act
      final result = await repository.getMovieDetail(id);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getMovieDetail call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getMovieDetail(id)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getMovieDetail(id);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a MovieResultsModel when the method getCastCrew calls the datasource',
    () async {
      final getCastCrewList = CastCrewResultModel(id: 2, cast: [], crew: []);
      // arrange
      when(() => dataSource.getCastCrew(id)).thenAnswer((_) async => getCastCrewList);
      // act
      final result = await repository.getCastCrew(id);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getCastCrew call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getCastCrew(id)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getCastCrew(id);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a VideoResultModel when the method getVideos calls the datasource',
    () async {
      final videoResultModel = VideoResultModel(id: 2, videos: []);
      // arrange
      when(() => dataSource.getVideos(id)).thenAnswer((_) async => videoResultModel);
      // act
      final result = await repository.getVideos(id);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getVideos call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getVideos(id)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getVideos(id);
      // assert
      expect(result.isLeft(), true);
    },
  );

  test(
    'should return a VideoResultModel when the method getVideos calls the datasource',
    () async {
      const searchText = 'whatever';
      // arrange
      when(() => dataSource.getSearchedMovies(searchText)).thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getSearchedMovies(searchText);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getSearchedMovies call is unsuccessful to the datasource',
    () async {
      // arrange
      const searchText = 'whatever';
      when(() => dataSource.getSearchedMovies(searchText)).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getSearchedMovies(searchText);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
