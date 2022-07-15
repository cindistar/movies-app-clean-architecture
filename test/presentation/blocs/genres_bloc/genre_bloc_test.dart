import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/genre_entity.dart';
import 'package:app_example/domain/usecases/get_all_genres_usecase.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:app_example/presentation/blocs/genres_bloc/genre_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenreBloc extends MockBloc<GenreEvent, GenreState> implements GenreBloc {}

class MockGetAllGenresUsecase extends Mock implements GetAllGenresUsecase {}

void main() {
  late GenreBloc genreBloc;

  late MockGetAllGenresUsecase mockGetAllGenresUsecase;

  setUp(() {
    mockGetAllGenresUsecase = MockGetAllGenresUsecase();
    genreBloc = GenreBloc(mockGetAllGenresUsecase);
  });

  test(
    'genreBloc should have initial state as [GenreInitial]',
    () {
      expect(genreBloc.state.runtimeType, GenreInitial);
    },
  );

  blocTest<GenreBloc, GenreState>(
    'emits [GenreLoading, GenreLoaded] when GenreTapEventStarted is added.',
    setUp: () {
      final noParams = NoParams();
      when(() => mockGetAllGenresUsecase(noParams)).thenAnswer((_) async => const Right(<GenreEntity>[]));
    },
    build: () => genreBloc,
    act: (bloc) => bloc.add(GenreTapEventStarted()),
    expect: () => const <GenreState>[GenreLoading(), GenreLoaded(genreList: <GenreEntity>[])],
  );

  blocTest<GenreBloc, GenreState>(
    'emits [GenreLoading, GenreError] when GenreTapEventStarted is added.',
    setUp: () {
      final noParams = NoParams();
      when(() => mockGetAllGenresUsecase(noParams)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
    },
    build: () => genreBloc,
    act: (bloc) => bloc.add(GenreTapEventStarted()),
    expect: () => const <GenreState>[GenreLoading(), GenreError('Ops! Something went wrong')],
  );
}
