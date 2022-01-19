import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/genre_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGenreRepository {
 Future<Either<Failure, List<GenreEntity>>> getAllGenres();
}