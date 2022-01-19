import 'package:app_example/core/errors/exceptions.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/data/models/genre_list_model.dart';
import 'package:dio/dio.dart';

abstract class IGenreRemoteDataSource {
  Future<GenreModel> getAllGenres();
}

class GenreRemoteDatasourceImplementation extends IGenreRemoteDataSource {
  final HttpClient client;

  GenreRemoteDatasourceImplementation(this.client);

  @override
  Future<GenreModel> getAllGenres() async {
    Response response = await client.get(ApiUrls.movieGenres());
    final genresList = GenreModel.fromMap(response.data);
    //print(genresList.genres);
    if (response.statusCode == 200) {
      return genresList;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }
}
