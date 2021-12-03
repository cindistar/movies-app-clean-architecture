import 'dart:convert';

import 'package:app_example/domain/entitites.dart/movie_entity.dart';

import 'movie_model.dart';


class MovieResultsModel extends MovieEntity {
    MovieResultsModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    }) : super(0, '', '', 0.0, '', DateTime.now(), '', 0.0, 0);

    final int page;
    final List<MovieModel> results;
    final int totalPages;
    final int totalResults;

    factory MovieResultsModel.fromJson(String str) => MovieResultsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieResultsModel.fromMap(Map<String, dynamic> json) => MovieResultsModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

