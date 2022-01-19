part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class SearchTextEvent extends SearchMoviesEvent {
  final String searchText;

  const SearchTextEvent(this.searchText);

  @override
  List<Object> get props => [searchText];
}
