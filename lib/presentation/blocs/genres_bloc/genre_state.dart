part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {
  const GenreInitial();

  @override
  List<Object> get props => [];
}

class GenreLoading extends GenreState {
  const GenreLoading();

  @override
  List<Object> get props => [];
}

class GenreLoaded extends GenreState {
  final List<GenreEntity> genreList;

  const GenreLoaded({required this.genreList});

  @override
  List<Object> get props => [genreList];
}

class GenreError extends GenreState {
  final String message;

  const GenreError(this.message);
  @override
  List<Object> get props => [message];
}
