import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/models/movie_results_model.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImplementation implements IMovieRepository {
  final IMovieRemoteDataSource remoteDataSource;

  MovieRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, MovieResultsModel>> getNowPlayingMovies() async {
    try {
      final movies = await remoteDataSource.getNowPlayingMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieResultsModel>> getPopularMovies() async {
    try {
      final movies = await remoteDataSource.getPopularMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieResultsModel>> getTopRatedMovies() async {
    try {
      final movies = await remoteDataSource.getTopRatedMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieResultsModel>> getTrendingMovies() async {
    try {
      final movies = await remoteDataSource.getTrendingMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieResultsModel>> getUpcomingMovies() async {
    try {
      final movies = await remoteDataSource.getUpcomingMovies();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
