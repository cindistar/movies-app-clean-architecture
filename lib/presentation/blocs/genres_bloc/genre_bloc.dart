import 'package:app_example/domain/entitites.dart/genre_entity.dart';
import 'package:app_example/domain/usecases/get_all_genres_usecase.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GetAllGenresUsecase allGenresusecase;

  GenreBloc(this.allGenresusecase) : super(const GenreInitial()) {
    on<GenreTapEventStarted>(getAllGenres);
  }

  Future<void> getAllGenres(event, emit) async {
    emit(const GenreLoading());
    var getGenres = await allGenresusecase(NoParams());
    getGenres.fold(
      (failure) => emit(const GenreError('Ops! Something went wrong')),
      (success) => emit(GenreLoaded(
        genreList: success,
      )),
    );
  }
}
