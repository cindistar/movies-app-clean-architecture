import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_popular_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_trending_movies_usecase.dart';
import 'package:app_example/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetTrendingMoviesUsecase trendingUsecase;
  final GetUpcomingMoviesUsecase upcomingUsecase;
  final GetTopRatMoviesUsecase topRatedUsecase;
  final GetPopularMoviesUsecase popularUsecase;
  final GetNowPlayingMoviesUsecase nowPlayingUsecase;

  int page = 1;

  MoviesBloc(
    this.trendingUsecase,
    this.upcomingUsecase,
    this.topRatedUsecase,
    this.popularUsecase,
    this.nowPlayingUsecase,
  ) : super(const MoviesInitial()) {
    on<GetTrendingMoviesEvent>(getTrendingMovies);
    on<GetUpcomingMoviesEvent>(getUpcomingMovies);
    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
    on<GetPopularMoviesEvent>(getPopularMovies);
    on<GetNowPlayingMoviesvent>(getNowPlayingMoviesvent);
  }

  Future<void> getTrendingMovies(event, emit) async {
    emit(const MoviesLoading(loading: true));
    var getMovies = await trendingUsecase(page);
    getMovies.fold(
      (failure) => emit(const MoviesError('Ops! Something went wrong')),
      (success) => emit(
        MoviesLoaded(
          movies: success,
        ),
      ),
    );
    page++;
  }

  Future<void> getUpcomingMovies(event, emit) async {
    emit(const MoviesLoading(loading: true));
    var getMovies = await upcomingUsecase(page);
    getMovies.fold(
      (failure) => emit(const MoviesError('Ops! Something went wrong')),
      (success) => emit(
        MoviesLoaded(
          movies: success,
        ),
      ),
    );
    page++;
  }

  Future<void> getTopRatedMovies(event, emit) async {
    emit(const MoviesLoading(loading: true));
    var getMovies = await topRatedUsecase(page);
    getMovies.fold(
      (failure) => emit(const MoviesError('Ops! Something went wrong')),
      (success) => emit(
        MoviesLoaded(
          movies: success,
        ),
      ),
    );
    page++;
  }

  Future<void> getPopularMovies(event, emit) async {
    emit(const MoviesLoading(loading: true));
    var getMovies = await popularUsecase(page);
    getMovies.fold(
      (failure) => emit(const MoviesError('Ops! Something went wrong')),
      (success) => emit(
        MoviesLoaded(
          movies: success,
        ),
      ),
    );
    page++;
  }

  Future<void> getNowPlayingMoviesvent(event, emit) async {
    emit(const MoviesLoading(loading: true));
    var getMovies = await nowPlayingUsecase(page);
    getMovies.fold(
      (failure) => emit(const MoviesError('Ops! Something went wrong')),
      (success) => emit(
        MoviesLoaded(
          movies: success,
        ),
      ),
    );
    page++;
  }
}
