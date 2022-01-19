import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCastUsecase implements UseCase<CastEntity, int> {
  final IMovieRepository repository;

  GetCastUsecase(this.repository);
 
  @override
  Future<Either<Failure, List<CastEntity>>> call(id) async {
    return await repository.getCastCrew(id);
  }
}
