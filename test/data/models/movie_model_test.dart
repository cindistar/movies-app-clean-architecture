import 'dart:convert';

import 'package:app_example/data/models/movie_model.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/movie_model_mock.dart';

void main() {
  const movieModel = MovieModel(
    posterPath: "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
    adult: false,
    overview: "It's a movie",
    releaseDate: "2016-08-03",
    genreIds: [14, 28, 80],
    id: 297761,
    originalTitle: "Suicide Squad",
    originalLanguage: "en",
    title: "Suicide Squad",
    backdropPath: "",
    popularity: 0.0,
    voteCount: 0,
    video: false, 
    voteAverage: 0.0,
  );
  test('should be a subclass of MovieEntity', () {
    expect(movieModel, isA<MovieEntity>());
  });

  test(
    'should return a valid model',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(movieModelMock);
      // act
      final result = MovieModel.fromMap(jsonMap);
      // assert
      expect(result, movieModel);
    },
  );
  test(
    'should return a json map containing the proper data',
    () async {
      final expectedMap = {
        "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
        "adult": false,
        "overview": "It's a movie",
        "release_date": "2016-08-03",
        "genre_ids": [14, 28, 80],
        "id": 297761,
        "original_title": "Suicide Squad",
        "original_language": "en",
        "title": "Suicide Squad",
        "backdrop_path": "",
        "popularity": 0.0,
        "vote_count": 0,
        "video": false,
        "vote_average": 0.0
      };
      // arrange
      // act
      final result = movieModel.toMap();
      // assert
      expect(result, expectedMap);
    },
  );
}
