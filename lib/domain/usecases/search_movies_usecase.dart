import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class SearchMoviesUsecase implements UseCase<MovieEntity, String> {
  final IMovieRepository repository;

  SearchMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String searchText) async {
    
    return await repository.getSearchedMovies(searchText);
  }
}
