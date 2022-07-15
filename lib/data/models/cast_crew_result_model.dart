// ignore_for_file: annotate_overrides, overridden_fields

import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:equatable/equatable.dart';

class CastCrewResultModel extends Equatable {
  const CastCrewResultModel({
    required this.id,
    required this.cast,
    required this.crew,
  });
  final int id;
  final List<CastModel> cast;
  final List<Crew> crew;

  factory CastCrewResultModel.fromMap(Map<String, dynamic> json) => CastCrewResultModel(
        id: json["id"] ?? 1,
        cast: List<CastModel>.from(json["cast"].map((x) => CastModel.fromMap(x))),
        crew: List<Crew>.from(json["crew"].map((x) => Crew.fromMap(x))),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cast': cast,
      'crew': crew,
    };
  }

  @override
  List<Object> get props => [id, cast, crew];
}

class CastModel extends CastEntity {
  const CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  }) : super(
          creditId: creditId,
          name: name,
          posterPath: profilePath,
          character: character,
        );
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  factory CastModel.fromMap(Map<String, dynamic> json) => CastModel(
        adult: json["adult"] ?? false,
        gender: json["gender"] ?? 1,
        id: json["id"] ?? 1,
        knownForDepartment: json["known_for_department"] ?? '',
        name: json["name"] ?? '',
        originalName: json["original_name"] ?? '',
        popularity: json["popularity"] ?? 2.2,
        profilePath: json["profile_path"] ?? '',
        castId: json["cast_id"] ?? 2,
        character: json["character"] ?? 'No information',
        creditId: json["credit_id"] ?? '',
        order: json["order"] ?? 3,
      );

  Map<String, dynamic> toMap() {
    return {
      "adult": adult,
      "gender": gender,
      "id": id,
      "known_for_department": knownForDepartment,
      "name": name,
      "original_name": originalName,
      "popularity": popularity,
      "profile_path": profilePath,
      "cast_id": castId,
      "creditId": creditId,
      "character": character,
      "order": order,
    };
  }
}

class Crew {
  Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });
  late final bool adult;
  late final int gender;
  late final int id;
  late final String knownForDepartment;
  late final String name;
  late final String originalName;
  late final double popularity;
  late final String? profilePath;
  late final String creditId;
  late final String department;
  late final String job;

  Crew.fromMap(Map<String, dynamic> json) {
    adult = json['adult'] ?? false;
    gender = json['gender'] ?? 1;
    id = json['id'] ?? 2;
    knownForDepartment = json['known_for_department'] ?? '';
    name = json['name'] ?? '';
    originalName = json['original_name'] ?? '';
    popularity = json['popularity'] ?? '';
    profilePath = json['profile_path'] ?? '';
    creditId = json['credit_id'] ?? '';
    department = json['department'] ?? '';
    job = json['job'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      "adult": adult,
      "gender": gender,
      "id": id,
      "known_for_department": knownForDepartment,
      "name": name,
      "original_name": originalName,
      "popularity": popularity,
      "profile_path": profilePath,
      "credit_id": creditId,
      "department": department,
      "job": job,
    };
  }
}
