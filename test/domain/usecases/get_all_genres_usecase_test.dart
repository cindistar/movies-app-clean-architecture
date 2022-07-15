import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/genre_entity.dart';
import 'package:app_example/domain/repositories/genre_repository.dart';
import 'package:app_example/domain/usecases/get_all_genres_usecase.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/genre_entity_fake.dart';

class MockGenreRepository extends Mock implements IGenreRepository {}

void main() {
  late GetAllGenresUsecase usecase;
  late IGenreRepository repository;

  setUp(() {
    repository = MockGenreRepository();
    usecase = GetAllGenresUsecase(repository);
  });

  final noParams = NoParams();

  test(
    'should return a list of GenreEntity when succeed',
    () async {
      // arrange
      when(() => repository.getAllGenres()).thenAnswer(
        (_) async => const Right(<GenreEntity>[genreEntity]),
      );
      // act
      final result = await usecase(noParams);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a failure when it doesn\'t succeed',
    () async {
      // arrange
      when(() => repository.getAllGenres()).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
      // act
      final result = await usecase(noParams);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
