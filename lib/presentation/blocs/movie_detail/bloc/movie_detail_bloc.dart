import 'package:app_example/domain/entitites.dart/movie_detail_entity.dart';
import 'package:app_example/domain/usecases/get_movie_detail.dart';
import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:app_example/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUsecase movieDetailUsecase;
  final CastBloc castBloc;
  final VideosBloc videosBloc;

  MovieDetailBloc(this.movieDetailUsecase, this.castBloc, this.videosBloc)
      : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>(getMovieDetail);
  }

  Future<void> getMovieDetail(event, emit) async {
    var getDetailMovie = await movieDetailUsecase(event.movieId);
    getDetailMovie.fold(
      (failure) => emit(const MovieDetailError('Something went wrong!')),
      (success) => emit(MovieDetailLoaded(movieDetailEntity: success)),
    );
    castBloc.add(LoadCastEvent(movieId: event.movieId));
    videosBloc.add(LoadVideosEvent(event.movieId));
  }
}
