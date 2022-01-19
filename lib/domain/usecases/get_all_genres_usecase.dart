import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/genre_entity.dart';
import 'package:app_example/domain/repositories/genre_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllGenresUsecase implements UseCase<GenreEntity, NoParams> {
  final IGenreRepository repository;

  GetAllGenresUsecase(this.repository);
 
  @override
  Future<Either<Failure, List<GenreEntity>>> call(NoParams noParams) async {
    return await repository.getAllGenres();
  }
}
