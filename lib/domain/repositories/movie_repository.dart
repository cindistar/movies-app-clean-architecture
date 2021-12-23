import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieRepository  {
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies(int page);

}