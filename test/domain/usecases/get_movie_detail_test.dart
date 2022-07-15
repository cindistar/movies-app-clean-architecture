// ignore_for_file: prefer_const_constructors

import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/get_movie_detail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/movie_detail_entity_fake.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetMovieDetailUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetMovieDetailUsecase(repository);
  });

  const id = 1;

  test(
    'should return an object of type MovieDetailEntity when succeed',
    () async {
      // arrange

      when(() => repository.getMovieDetail(id)).thenAnswer(
        (_) async => Right(movieDetailEntity),
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
      when(() => repository.getMovieDetail(id)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
      // act
      final result = await usecase(id);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
