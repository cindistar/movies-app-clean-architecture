import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/get_popular_movie_by_genre_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/movie_entity_fake.dart';


class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMovieByGenreUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieByGenreUsecase(repository);
  });

  const genreId = 1;

  test(
    'should return a list of MovieEntity when succeed',
    () async {
      // arrange
      when(() => repository.getMovieByGenre(genreId)).thenAnswer(
        (_) async => const Right(<MovieEntity>[movieEntity]),
      );
      // act
      final result = await usecase(genreId);
      // assert
      assert(result.isRight(), true);
    },
  );

  test(
    'should return a failure when it doesn\'t succeed',
    () async {
      // arrange
      when(() => repository.getMovieByGenre(genreId)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
      // act
      final result = await usecase(genreId);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
