import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/data/datasources/genre_remote_datasource.dart';
import 'package:app_example/data/models/genre_list_model.dart';
import 'package:app_example/data/repositories/genre_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenreRemoteDataSource extends Mock implements IGenreRemoteDataSource {}

void main() {
  late GenreRepositoryImplementation repository;
  late IGenreRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockGenreRemoteDataSource();
    repository = GenreRepositoryImplementation(dataSource);
  });

  test(
    'should return a GenreModel when the method getAllGenres calls to the datasource',
    () async {
      const genreModel = GenreModel(genres: []);
      // arrange
      when(() => dataSource.getAllGenres()).thenAnswer((_) async => genreModel);
      // act
      final result = await repository.getAllGenres();
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a server failure when the method getAllGenres call is unsuccessful to the datasource',
    () async {
      // arrange
      when(() => dataSource.getAllGenres()).thenThrow(const ServerException('message'));
      // act
      final result = await repository.getAllGenres();
      // assert
      expect(result.isLeft(), true);
    },
  );
}
