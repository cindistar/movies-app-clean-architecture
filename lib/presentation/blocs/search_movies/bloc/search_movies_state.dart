part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<MovieEntity> movies;

  const SearchMoviesLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchMoviesLoading extends SearchMoviesState {}


class SearchMoviesError extends SearchMoviesState {
  final String message;

  const SearchMoviesError(this.message);
  @override
  List<Object> get props => [message];
}
