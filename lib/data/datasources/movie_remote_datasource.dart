import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/data/models/movie_results_model.dart';
import 'package:dio/dio.dart';

abstract class IMovieRemoteDataSource {
  Future<MovieResultsModel> getTrendingMovies(int page);
  Future<MovieResultsModel> getUpcomingMovies(int page);
  Future<MovieResultsModel> getTopRatedMovies(int page);
  Future<MovieResultsModel> getPopularMovies(int page);
  Future<MovieResultsModel> getNowPlayingMovies(int page);
}

class MovieRemoteDataSourceImplementation implements IMovieRemoteDataSource {
  final HttpClient client;

  MovieRemoteDataSourceImplementation(this.client);

  @override
  Future<MovieResultsModel> getTrendingMovies(int page) async {
    Response response = await client.get(ApiUrls.trendingMovies(page));
    final movies = MovieResultsModel.fromMap(response.data);
    print(movies.results);
    if (response.statusCode == 200) {
      return movies;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }

  @override
  Future<MovieResultsModel> getNowPlayingMovies(int page) async {
    Response response = await client.get(ApiUrls.nowPlaying(page));
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
    if (response.statusCode == 200) {
      return movies;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }

  @override
  Future<MovieResultsModel> getPopularMovies(int page) async {
    Response response = await client.get(ApiUrls.popularMovies(page));
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
     if (response.statusCode == 200) {
      return movies;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }

  @override
  Future<MovieResultsModel> getTopRatedMovies(int page) async {
    Response response = await client.get(ApiUrls.topRatedMovies(page));
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
     if (response.statusCode == 200) {
      return movies;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }

  @override
  Future<MovieResultsModel> getUpcomingMovies(int page) async {
    Response response = await client.get(ApiUrls.upcomingMovies(page));
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
     if (response.statusCode == 200) {
      return movies;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }
}
