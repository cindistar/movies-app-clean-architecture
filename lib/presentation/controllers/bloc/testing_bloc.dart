import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/usecases/get_trending_movies_usecase.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'testing_event.dart';
part 'testing_state.dart';

class TestingBloc extends Bloc<TestingEvent, TestingState> {
  final GetTrendingMoviesUsecase trendingUsecase;
  TestingBloc(this.trendingUsecase) : super(TestingInitial()) {
    on<GetTrendingEvent>(getTrendingMovies);
  }
  Future getTrendingMovies(
      GetTrendingEvent event, Emitter<TestingState> emit) async {
    emit(TestingLoading());
    try {
      var getMovies = await trendingUsecase(NoParams());
      emit(getMovies
          .fold((failure) => (const TestingError('Ops! Something went wrong')),
              (success) {
        return (TestingLoaded(
          movies: getMovies as List<MovieEntity>,
        ));
      }));
    } catch (e) {
      const TestingError('Ops! Something went wrong');
    }
  }
}

