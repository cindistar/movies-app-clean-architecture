import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieRepository  {
  Future<Either<Failure, MovieEntity>> getTopRatedMovies();
  Future<Either<Failure, MovieEntity>> getNowPlayingMovies();
  Future<Either<Failure, MovieEntity>> getPopularMovies();
  Future<Either<Failure, MovieEntity>> getTrendingMovies();
  Future<Either<Failure, MovieEntity>> getUpcomingMovies();

}