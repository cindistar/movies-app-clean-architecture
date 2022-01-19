import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieByGenreUsecase implements UseCase<MovieEntity, int> {
  final IMovieRepository repository;

  GetMovieByGenreUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(int id) async {
    return await repository.getMovieByGenre(id);
  }
}