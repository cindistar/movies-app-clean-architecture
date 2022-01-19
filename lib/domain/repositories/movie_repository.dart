import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:app_example/domain/entitites.dart/movie_detail_entity.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovieByGenre(int genreId);
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies(int page);
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<Failure, List<CastEntity>>> getCastCrew(int id);
  Future<Either<Failure, List<VideoEntity>>> getVideos(int id);
  Future<Either<Failure, List<MovieEntity>>> getSearchedMovies(String searchText);
}
