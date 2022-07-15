import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/usecases/search_movies_usecase.dart';
import 'package:app_example/presentation/blocs/search_movies/bloc/search_movies_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchMoviesUsecase extends Mock implements SearchMoviesUsecase {}

void main() {
  late MockSearchMoviesUsecase mockSearchMoviesUsecase;
  late SearchMoviesBloc searchMoviesBloc;

  setUp(() {
    mockSearchMoviesUsecase = MockSearchMoviesUsecase();
    searchMoviesBloc = SearchMoviesBloc(mockSearchMoviesUsecase);
  });

  test(
    'movieDetailBloc should have initial state as [SearchMoviesInitial]',
    () {
      expect(searchMoviesBloc.state.runtimeType, SearchMoviesInitial);
    },
  );

  blocTest<SearchMoviesBloc, SearchMoviesState>(
    'emits [SearchMoviesLoading, SearchMoviesLoaded] when SearchTextEvent is added.',
    setUp: () {
      when(() => mockSearchMoviesUsecase('text')).thenAnswer((_) async => const Right(<MovieEntity>[]));
    },
    build: () => searchMoviesBloc,
    act: (bloc) => bloc.add(const SearchTextEvent('text')),
    expect: () => <SearchMoviesState>[SearchMoviesLoading(), const SearchMoviesLoaded(<MovieEntity>[])],
  );

  blocTest<SearchMoviesBloc, SearchMoviesState>(
    'emits [SearchMoviesLoading, ] when SearchTextEvent is added.',
    setUp: () {
      when(() => mockSearchMoviesUsecase('text')).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
    },
    build: () => searchMoviesBloc,
    act: (bloc) => bloc.add(const SearchTextEvent('text')),
    expect: () => <SearchMoviesState>[
      SearchMoviesLoading(),
      const SearchMoviesError('Something went wrong!'),
    ],
  );
}
