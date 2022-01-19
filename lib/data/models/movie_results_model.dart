import 'dart:convert';

import 'package:app_example/domain/entitites.dart/movie_entity.dart';

import 'movie_model.dart';

class MovieResultsModel extends MovieEntity {
   MovieResultsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  }) : super(
          id: 0,
          genreIds: <int>[],
          backdropPath: 'https://www.w3.org/200',
          overview: 'Ipsem Lorem',
          popularity: 1.0,
          posterPath: 'picture.jpg',
          releaseDate: '01/01/2000',
          title: 'Title',
          voteAverage: 1.0,
          voteCount: 30,
        );

  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  factory MovieResultsModel.fromJson(String str) =>
      MovieResultsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieResultsModel.fromMap(Map<String, dynamic> json) =>
      MovieResultsModel(
        page: json["page"] ?? 1,
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x))),
        totalPages: json["total_pages"] ?? 10,
        totalResults: json["total_results"] ?? 10,
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
