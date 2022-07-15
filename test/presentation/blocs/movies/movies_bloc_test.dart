import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_popular_movie_by_genre_usecase.dart';
import 'package:app_example/domain/usecases/get_popular_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_trending_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetTrendingMoviesUsecase extends Mock implements GetTrendingMoviesUsecase {}

class MockGetUpcomingMoviesUsecase extends Mock implements GetUpcomingMoviesUsecase {}

class MockGetTopRatMoviesUsecase extends Mock implements GetTopRatMoviesUsecase {}

class MockGetPopularMoviesUsecase extends Mock implements GetPopularMoviesUsecase {}

class MockGetNowPlayingMoviesUsecase extends Mock implements GetNowPlayingMoviesUsecase {}

class MockGetMovieByGenreUsecase extends Mock implements GetMovieByGenreUsecase {}

void main() {
  late MoviesBloc moviesBloc;

  late MockGetTrendingMoviesUsecase mockGetTrendingMoviesUsecase;
  late MockGetUpcomingMoviesUsecase mockGetUpcomingMoviesUsecase;
  late MockGetTopRatMoviesUsecase mockGetTopRatMoviesUsecase;
  late MockGetPopularMoviesUsecase mockGetPopularMoviesUsecase;
  late MockGetNowPlayingMoviesUsecase mockGetNowPlayingMoviesUsecase;
  late MockGetMovieByGenreUsecase mockGetMovieByGenreUsecase;

  setUp(() {
    mockGetTrendingMoviesUsecase = MockGetTrendingMoviesUsecase();
    mockGetUpcomingMoviesUsecase = MockGetUpcomingMoviesUsecase();
    mockGetTopRatMoviesUsecase = MockGetTopRatMoviesUsecase();
    mockGetPopularMoviesUsecase = MockGetPopularMoviesUsecase();
    mockGetNowPlayingMoviesUsecase = MockGetNowPlayingMoviesUsecase();
    mockGetMovieByGenreUsecase = MockGetMovieByGenreUsecase();

    moviesBloc = MoviesBloc(mockGetTrendingMoviesUsecase, mockGetUpcomingMoviesUsecase, mockGetTopRatMoviesUsecase,
        mockGetPopularMoviesUsecase, mockGetNowPlayingMoviesUsecase, mockGetMovieByGenreUsecase);
  });

  test(
    'moviesBloc should have initial state as [MovieInitial]',
    () {
      expect(moviesBloc.state.runtimeType, MoviesInitial);
    },
  );

  group('moviesBloc (Success)', () {
    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesLoaded] when GetTrendingMoviesEvent is added.',
      setUp: () {
        when(() => mockGetTrendingMoviesUsecase(1)).thenAnswer((_) async => const Right(<MovieEntity>[]));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetTrendingMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesLoaded(movies: <MovieEntity>[])],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesLoaded] when GetUpcomingMoviesEvent is added.',
      setUp: () {
        when(() => mockGetUpcomingMoviesUsecase(1)).thenAnswer((_) async => const Right(<MovieEntity>[]));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetUpcomingMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesLoaded(movies: <MovieEntity>[])],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesLoaded] when GetTopRatedMoviesEvent is added.',
      setUp: () {
        when(() => mockGetTopRatMoviesUsecase(1)).thenAnswer((_) async => const Right(<MovieEntity>[]));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetTopRatedMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesLoaded(movies: <MovieEntity>[])],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesLoaded] when GetPopularMoviesEvent is added.',
      setUp: () {
        when(() => mockGetPopularMoviesUsecase(1)).thenAnswer((_) async => const Right(<MovieEntity>[]));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(const GetPopularMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesLoaded(movies: <MovieEntity>[])],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesLoaded] when GetNowPlayingMoviesvent is added.',
      setUp: () {
        when(() => mockGetNowPlayingMoviesUsecase(1)).thenAnswer((_) async => const Right(<MovieEntity>[]));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetNowPlayingMoviesvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesLoaded(movies: <MovieEntity>[])],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesLoaded] when GetMovieByGenreEvent is added.',
      setUp: () {
        when(() => mockGetMovieByGenreUsecase(1)).thenAnswer((_) async => const Right(<MovieEntity>[]));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(const GetMovieByGenreEvent(1, 'name')),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesLoaded(movies: <MovieEntity>[])],
    );
  });

  group('MoviesBloc (Failure)', () {
    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesError] when GetTrendingMoviesEvent is added.',
      setUp: () {
        when(() => mockGetTrendingMoviesUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetTrendingMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesError('Something went wrong!')],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesError] when GetUpcomingMoviesEvent is added.',
      setUp: () {
        when(() => mockGetUpcomingMoviesUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetUpcomingMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesError('Something went wrong!')],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesError] when GetTopRatedMoviesEvent is added.',
      setUp: () {
        when(() => mockGetTopRatMoviesUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetTopRatedMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesError('Something went wrong!')],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesError] when GetPopularMoviesEvent is added.',
      setUp: () {
        when(() => mockGetPopularMoviesUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(const GetPopularMoviesEvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesError('Something went wrong!')],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesError] when GetNowPlayingMoviesvent is added.',
      setUp: () {
        when(() => mockGetNowPlayingMoviesUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(GetNowPlayingMoviesvent()),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesError('Something went wrong!')],
    );

    blocTest<MoviesBloc, MoviesState>(
      'emits [MoviesLoading, MoviesError] when GetMovieByGenreEvent is added.',
      setUp: () {
        when(() => mockGetMovieByGenreUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
      },
      build: () => moviesBloc,
      act: (bloc) => bloc.add(const GetMovieByGenreEvent(1, 'name')),
      expect: () => const <MoviesState>[MoviesLoading(loading: true), MoviesError('Something went wrong!')],
    );
  });
}
