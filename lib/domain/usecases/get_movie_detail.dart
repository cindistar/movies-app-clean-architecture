import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_detail_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailUsecase
    implements MovieDetailUseCase<MovieDetailEntity, int> {
  final IMovieRepository repository;

  GetMovieDetailUsecase(this.repository);

  @override
  Future<Either<Failure, MovieDetailEntity>> call(id) async {
    return await repository.getMovieDetail(id);
  }
}
