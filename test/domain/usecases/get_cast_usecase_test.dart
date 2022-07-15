import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/get_cast_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/cast_entity_fake.dart';


class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetCastUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetCastUsecase(repository);
  });

  const id = 1;

  test(
    'should return a list of CastEntity when succeed',
    () async {
      // arrange
      when(() => repository.getCastCrew(id)).thenAnswer(
        (_) async => const Right(<CastEntity>[castEntity]),
      );
      // act
      final result = await usecase(id);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a Failure when it doesn\'t succeed',
    () async {
      // arrange
      when(() => repository.getCastCrew(id)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
      // act
      final result = await usecase(id);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
