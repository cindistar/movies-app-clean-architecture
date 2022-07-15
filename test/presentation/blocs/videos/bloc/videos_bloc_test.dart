import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/domain/usecases/get_videos_usecase.dart';
import 'package:app_example/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetVideosUsecase extends Mock implements GetVideosUsecase {}

void main() {
  late MockGetVideosUsecase mockGetVideosUsecase;
  late VideosBloc videosBloc;

  setUp(() {
    mockGetVideosUsecase = MockGetVideosUsecase();
    videosBloc = VideosBloc(mockGetVideosUsecase);
  });

  test(
    'videosBloc should have initial state as [VideosInitial]',
    () {
      expect(videosBloc.state.runtimeType, VideosInitial);
    },
  );

  blocTest<VideosBloc, VideosState>(
    'emits [VideosLoaded] when LoadVideosEvent is added.',
    setUp: () {
      when(() => mockGetVideosUsecase(1)).thenAnswer((_) async => const Right(<VideoEntity>[]));
    },
    build: () => videosBloc,
    act: (bloc) => bloc.add(const LoadVideosEvent(1)),
    expect: () => const <VideosState>[VideosLoaded(videos: <VideoEntity>[])],
  );

  blocTest<VideosBloc, VideosState>(
    'emits [NoVideos] when MyEvent is added.',
    setUp: () {
      when(() => mockGetVideosUsecase(1)).thenAnswer((_) async => Left(NullParamFailure()));
    },
    build: () => videosBloc,
    act: (bloc) => bloc.add(const LoadVideosEvent(1)),
    expect: () => <VideosState>[NoVideos()],
  );
}
