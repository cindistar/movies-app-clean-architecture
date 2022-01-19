// ignore_for_file: annotate_overrides

import 'dart:convert';

import 'package:app_example/data/models/genre_model.dart';
import 'package:app_example/domain/entitites.dart/movie_detail_entity.dart';
import 'package:flutter/foundation.dart';

MovieDetailModel movieDetailModelFromMap(String str) =>
    MovieDetailModel.fromMap(json.decode(str));

String movieDetailModelToMap(MovieDetailModel data) =>
    json.encode(data.toMap());

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
     this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
     this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          false,
          '',
          null,
          0,
          [],
          '',
          0,
          '',
          '',
          '',
          '',
          0.0,
          '',
          [],
          [],
          '',
          0,
          0,
          [],
          '',
          '',
          '',
          false,
          0.0,
          0,
        );

  // ignore: overridden_fields
  final bool adult;
  // ignore: overridden_fields
  final String backdropPath;
  // ignore: overridden_fields
  final dynamic belongsToCollection;
  // ignore: overridden_fields
  final int budget;
  // ignore: overridden_fields
  final List<Genre> genres;
  // ignore: overridden_fields
  final String homepage;
  // ignore: overridden_fields
  final int id;
  // ignore: overridden_fields
  final String imdbId;
  // ignore: overridden_fields
  final String originalLanguage;
  // ignore: overridden_fields
  final String originalTitle;
  // ignore: overridden_fields
  final String overview;
  // ignore: overridden_fields
  final double popularity;
  // ignore: overridden_fields
  final String? posterPath;
  // ignore: overridden_fields
  final List<ProductionCompany> productionCompanies;
  // ignore: overridden_fields
  final List<ProductionCountry> productionCountries;
  // ignore: overridden_fields
  final String? releaseDate;
  // ignore: overridden_fields
  final int revenue;
  // ignore: overridden_fields
  final int runtime;
  // ignore: overridden_fields
  final List<SpokenLanguage> spokenLanguages;
  // ignore: overridden_fields
  final String status;
  // ignore: overridden_fields
  final String tagline;
  // ignore: overridden_fields
  final String title;
  // ignore: overridden_fields
  final bool video;
  // ignore: overridden_fields
  final double voteAverage;
  // ignore: overridden_fields
  final int voteCount;

  factory MovieDetailModel.fromMap(Map<String, dynamic> json) =>
      MovieDetailModel(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? '',
        belongsToCollection: json["belongs_to_collection"] ?? '',
        budget: json["budget"] ?? 0,
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"] ?? '',
        id: json["id"],
        imdbId: json["imdb_id"] ?? '',
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? 'No information',
        overview: json["overview"] ?? '',
        popularity: json["popularity"].toDouble() ?? 0.0,
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromMap(x))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((x) => ProductionCountry.fromMap(x))),
        releaseDate: json["release_date"] ?? '', 
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: json["vote_average"].toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies.map((x) => x.toMap()).toList(),
      'productionCountries': productionCountries.map((x) => x.toMap()).toList(),
      'releaseDate': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetailModel &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.belongsToCollection == belongsToCollection &&
        other.budget == budget &&
        listEquals(other.genres, genres) &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdbId == imdbId &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.productionCountries, productionCountries) &&
        other.releaseDate == releaseDate &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        listEquals(other.spokenLanguages, spokenLanguages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdropPath.hashCode ^
        belongsToCollection.hashCode ^
        budget.hashCode ^
        genres.hashCode ^
        homepage.hashCode ^
        id.hashCode ^
        imdbId.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        productionCompanies.hashCode ^
        productionCountries.hashCode ^
        releaseDate.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        spokenLanguages.hashCode ^
        status.hashCode ^
        tagline.hashCode ^
        title.hashCode ^
        video.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }

  @override
  String toString() {
    return 'MovieDetailModel(adult: $adult, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, productionCompanies: $productionCompanies, productionCountries: $productionCountries, releaseDate: $releaseDate, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompany.fromMap(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"] ?? '',
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromJson(String source) =>
      ProductionCompany.fromMap(json.decode(source));
}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  factory ProductionCountry.fromMap(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
