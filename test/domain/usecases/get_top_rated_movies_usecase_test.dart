import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/movie_entity_fake.dart';


class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetTopRatMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetTopRatMoviesUsecase(repository);
  });

  test(
    'should return a list of MovieEntity with page number for pagination from the repository',
    () async {
      // arrange
      const page = 1;
      when(() => repository.getTopRatedMovies(page)).thenAnswer(
        (_) async => const Right(<MovieEntity>[movieEntity]),
      );
      // act
      final result = await usecase(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a failure when it doesn\'t  succeed',
    () async {
      // arrange
      const page = 1;
      when(() => repository.getTopRatedMovies(page)).thenAnswer(
        (_) async => Left(InvalidPageFailure('Invalid page')),
      );
      // act
      final result = await usecase(page);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
