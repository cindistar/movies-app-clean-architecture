// ignore_for_file: annotate_overrides, overridden_fields

import 'package:app_example/domain/entitites.dart/cast_entity.dart';

class CastCrewResultModel {
  CastCrewResultModel({
    required this.id,
    required this.cast,
    required this.crew,
  });
  late final int id;
  late final List<CastModel> cast;
  late final List<Crew> crew;

  CastCrewResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cast = List.from(json['cast']).map((e) => CastModel.fromJson(e)).toList();
    crew = List.from(json['crew']).map((e) => Crew.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cast'] = cast.map((e) => e.toJson()).toList();
    _data['crew'] = crew.map((e) => e.toJson()).toList();
    return _data;
  }
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

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      order: json['order'],
      profilePath: json['profile_path'],
      adult: json['adult'],
      knownForDepartment: json['known_for_department'],
      originalName: json['original_name'],
      popularity: json['popularity'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['known_for_department'] = knownForDepartment;
    _data['name'] = name;
    _data['original_name'] = originalName;
    _data['popularity'] = popularity;
    _data['profile_path'] = profilePath;
    _data['cast_id'] = castId;
    _data['character'] = character;
    _data['credit_id'] = creditId;
    _data['order'] = order;
    return _data;
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

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['known_for_department'] = knownForDepartment;
    _data['name'] = name;
    _data['original_name'] = originalName;
    _data['popularity'] = popularity;
    _data['profile_path'] = profilePath;
    _data['credit_id'] = creditId;
    _data['department'] = department;
    _data['job'] = job;
    return _data;
  }
}
