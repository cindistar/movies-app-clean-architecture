import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetNowPlayingMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetNowPlayingMoviesUsecase(repository);
  });
  test(
    'should return a list of MovieEntity with page number for pagination from the repository',
    () async {
      // arrange
      const page = 1;
      const movies = MovieEntity(
        id: 0,
        backdropPath: 'https://www.w3.org/2000/',
        overview: 'Ipsem Lorem',
        popularity: 1.0,
        posterPath: 'picture.jpg',
        releaseDate: '01/01/2000',
        title: 'Title',
        voteAverage: 1.0,
        voteCount: 30,
      );
      when(() => repository.getNowPlayingMovies(page))
          .thenAnswer((_) async => const Right(<MovieEntity>[movies]));
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
      when(() => repository.getNowPlayingMovies(page))
          .thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      // act
      final result = await usecase(page);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
