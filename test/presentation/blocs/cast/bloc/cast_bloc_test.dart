import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:app_example/domain/usecases/get_cast_usecase.dart';
import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCastUsecase extends Mock implements GetCastUsecase {}

void main() {
  late CastBloc castBloc;
  late MockGetCastUsecase mockGetCastUsecase;

  setUp(() {
    mockGetCastUsecase = MockGetCastUsecase();

    castBloc = CastBloc(mockGetCastUsecase);
  });

  test(
    'castBloc should have initial state as [CastInitial]', () {
      expect(castBloc.state.runtimeType, CastInitial);
    },
  );

  blocTest<CastBloc, CastState>(
    'emits [CastLoaded] when LoadCastEvent is added.',
    setUp: () {
      when(() => mockGetCastUsecase(1)).thenAnswer((_) async => const Right(<CastEntity>[]));
    },
    build: () => castBloc,
    act: (bloc) => bloc.add(const LoadCastEvent(movieId: 1)),
    expect: () => const <CastState>[CastLoaded(casts: <CastEntity>[])],
  );

  blocTest<CastBloc, CastState>(
    'emits [CastError] when LoadCastEvent is added.',
    setUp: () {
      when(() => mockGetCastUsecase(1)).thenAnswer((_) async => Left(InvalidPageFailure('Invalid page')));
    },
    build: () => castBloc,
    act: (bloc) => bloc.add(const LoadCastEvent(movieId: 1)),
    expect: () => const <CastState>[CastError('Something went wrong!')],
  );
}
