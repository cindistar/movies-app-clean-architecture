import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/usecases/get_movie_detail.dart';
import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:app_example/presentation/blocs/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:app_example/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../entities_fake/movie_detail_entity_fake.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState> implements MovieDetailBloc {}

class MockGetMovieDetailUsecase extends Mock implements GetMovieDetailUsecase {}

class MockCastBloc extends MockBloc<CastEvent, CastState> implements CastBloc {}

class MockVideosBloc extends MockBloc<VideosEvent, VideosState> implements VideosBloc {}

void main() {
  late MovieDetailBloc movieDetailBloc;
  late MockGetMovieDetailUsecase mockGetMovieDetailUsecase;
  late MockCastBloc mockCastBloc;
  late MockVideosBloc mockVideosBloc;

  setUp(() {
    mockGetMovieDetailUsecase = MockGetMovieDetailUsecase();
    mockCastBloc = MockCastBloc();
    mockVideosBloc = MockVideosBloc();

    movieDetailBloc = MovieDetailBloc(mockGetMovieDetailUsecase, mockCastBloc, mockVideosBloc);
  });

  test(
    'movieDetailBloc should have initial state as [MovieInitial]',
    () {
      expect(movieDetailBloc.state.runtimeType, MovieDetailInitial);
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'emits [MovieDetailLoaded] when MovieDetailLoadEvent is added.',
    setUp: () {
      when(() => mockGetMovieDetailUsecase(1)).thenAnswer((_) async => const Right(movieDetailEntity));
    },
    build: () => movieDetailBloc,
    act: (bloc) => bloc.add(const MovieDetailLoadEvent(1)),
    expect: () => <MovieDetailState>[const MovieDetailLoaded(movieDetailEntity: movieDetailEntity)],
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'emits [MovieDetailError] when MovieDetailLoadEvent is added.',
    setUp: () {
      when(() => mockGetMovieDetailUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
    },
    build: () => movieDetailBloc,
    act: (bloc) => bloc.add(const MovieDetailLoadEvent(1)),
    expect: () => const <MovieDetailState>[MovieDetailError('Something went wrong!')],
  );
}
