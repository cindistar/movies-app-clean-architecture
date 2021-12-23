// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:app_example/domain/entitites.dart/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          id: id,
          backdropPath: backdropPath,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int? id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath:
            json["backdrop_path"] ?? '',
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] ?? 297761,
        originalLanguage: json["original_language"] ?? 'en',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? 'It\'s a movie',
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"] ?? '75aHn1NOYXh4M7L5shoeQ6NGykP.jpg',
        releaseDate: json["release_date"] ?? '2016-08-03',
        title: json["title"] ?? 'Suicide Squad',
        video: json["video"] ?? false,
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "original_language": originalLanguage,
         "title": title,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "vote_average": voteAverage,
       
      };
}
