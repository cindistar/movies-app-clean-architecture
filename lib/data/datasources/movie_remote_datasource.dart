import 'package:app_example/core/api_client/dio_client.dart';
import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/data/models/movie_results_model.dart';
import 'package:dio/dio.dart';

abstract class IMovieRemoteDataSource {
  Future<MovieResultsModel> getTrendingMovies();
  Future<MovieResultsModel> getUpcomingMovies();
  Future<MovieResultsModel> getTopRatedMovies();
  Future<MovieResultsModel> getPopularMovies();
  Future<MovieResultsModel> getNowPlayingMovies();
}

class MovieRemoteDataSourceImplementation implements IMovieRemoteDataSource {
  final CustomDio client;

  MovieRemoteDataSourceImplementation(this.client);

  @override
  Future<MovieResultsModel> getTrendingMovies() async {
    Response response = await client.dio().get(ApiUrls.trendingMovies('day'));
    final movies = MovieResultsModel.fromMap(response.data);
    print(movies.results);
    return movies;
  }

  @override
  Future<MovieResultsModel> getNowPlayingMovies() async {
    Response response = await client.dio().get(ApiUrls.nowPlaying);
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
    return movies;
  }

  @override
  Future<MovieResultsModel> getPopularMovies() async {
    Response response = await client.dio().get(ApiUrls.popularMovies);
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
    return movies;
  }

  @override
  Future<MovieResultsModel> getTopRatedMovies() async {
    Response response = await client.dio().get(ApiUrls.topRatedMovies);
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
    return movies;
  }

  @override
  Future<MovieResultsModel> getUpcomingMovies() async {
    Response response = await client.dio().get(ApiUrls.upcomingMovies);
    final movies = MovieResultsModel.fromMap(response.data);
    //print(movies.results);
    return movies;
  }
}
