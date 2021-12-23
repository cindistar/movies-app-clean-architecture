part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {
  const MoviesInitial();
  @override
  List<Object> get props => [];
}

class MoviesLoading extends MoviesState {
  final bool loading;

  const MoviesLoading({required this.loading});
  @override
  List<Object> get props => [];
}

class MoviesLoaded extends MoviesState {
  final List<MovieEntity> movies;

  const MoviesLoaded({required this.movies});
  @override
  List<Object> get props => [movies];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);
  @override
  List<Object> get props => [message];
}
