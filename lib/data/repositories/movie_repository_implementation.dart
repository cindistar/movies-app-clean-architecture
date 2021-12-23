import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/models/movie_model.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImplementation implements IMovieRepository {
  final IMovieRemoteDataSource remoteDataSource;

  MovieRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies(
      int page) async {
    try {
      final movies = await remoteDataSource.getNowPlayingMovies(page);
      return Right(movies.results);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies(int page) async {
    try {
      final movies = await remoteDataSource.getPopularMovies(page);
      return Right(movies.results);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies(int page) async {
    try {
      final movies = await remoteDataSource.getTopRatedMovies(page);
      return Right(movies.results);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies(int page) async {
    try {
      final movies = await remoteDataSource.getTrendingMovies(page);
      return Right(movies.results);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getUpcomingMovies(int page) async {
    try {
      final movies = await remoteDataSource.getUpcomingMovies(page);
      return Right(movies.results);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
