import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/domain/usecases/get_videos_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideosUsecase getVideosUsecase;

  VideosBloc(this.getVideosUsecase) : super(VideosInitial()) {
    on<LoadVideosEvent>(getVideosEvent);
  }
  Future<void> getVideosEvent(event, emit) async {
    var getVideos = await getVideosUsecase(event.movieId);
    getVideos.fold(
      (failure) => emit(NoVideos()),
      (success) => emit(VideosLoaded(videos: success)),
    );
  }
}
