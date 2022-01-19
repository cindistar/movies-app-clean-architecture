import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/usecases/search_movies_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMoviesUsecase searchMoviesUsecase;

  SearchMoviesBloc(this.searchMoviesUsecase) : super(SearchMoviesInitial()) {
    on<SearchTextEvent>(getSearchedMovies);
  }
  Future<void> getSearchedMovies(event, emit) async {
    emit(SearchMoviesLoading());
    if (event.searchText.length > 2) {
      var searchMovies = await searchMoviesUsecase(event.searchText);
      searchMovies.fold(
        (failure) => emit(
          const SearchMoviesError(
            'Something went wrong!',
          ),
        ),
        (success) => emit(
          SearchMoviesLoaded(
            success,
          ),
        ),
      );
    }
  }
}
