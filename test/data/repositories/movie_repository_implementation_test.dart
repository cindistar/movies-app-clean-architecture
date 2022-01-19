import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/models/movie_results_model.dart';
import 'package:app_example/data/repositories/movie_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRemoteDatasource extends Mock implements IMovieRemoteDataSource {
}

void main() {
  late MovieRepositoryImplementation repository;
  late IMovieRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockMovieRemoteDatasource();
    repository = MovieRepositoryImplementation(dataSource);
  });

  test(
    'should return a MovieResultsModel when it calls the datasource',
    () async {
      // arrange
      const page = 1;
      var movieResultsModel = MovieResultsModel(
        page: page,
        results: const [],
        totalPages: 0,
        totalResults: 0,
      );
      when(() => dataSource.getNowPlayingMovies(page))
          .thenAnswer((_) async => movieResultsModel);
      // act
      final result = await repository.getNowPlayingMovies(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when it\'s unsuccessful the call to the datasource',
    () async {
      // arrange
      const page = 1;
      when(() => dataSource.getNowPlayingMovies(page)).thenThrow(
         const ServerException('Server failure!'));
      // act
      final result = await repository.getNowPlayingMovies(page);
      // assert
      expect(result.isLeft(),  true);
    },
  );
}
