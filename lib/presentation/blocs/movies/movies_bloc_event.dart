part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent ();

  @override
  List<Object> get props => [];
}

class GetTrendingMoviesEvent extends MoviesEvent  {
  @override
  List<Object> get props => [];
}

class GetUpcomingMoviesEvent extends MoviesEvent  {
  @override
  List<Object> get props => [];
}


class GetTopRatedMoviesEvent extends MoviesEvent  {
  @override
  List<Object> get props => [];
}

class GetPopularMoviesEvent extends MoviesEvent  {
  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesvent extends MoviesEvent  {
  @override
  List<Object> get props => [];
}