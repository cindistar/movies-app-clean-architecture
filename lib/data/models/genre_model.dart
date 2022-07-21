// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:app_example/domain/entitites.dart/genre_entity.dart';

class Genre extends GenreEntity {
  // ignore: annotate_overrides
  final int id;

  final String name;

  const Genre({
    required this.name,
    required this.id,
  }) : super(
          id: id,
          genreName: name,
        );

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"] ?? 1,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

// List<Genre> genre = [
//   const Genre(id: 28, name: "Action"),
//   const Genre(id: 12, name: "Adventure"),
//   const Genre(id: 16, name: "Animation"),
//   const Genre(id: 35, name: "Comedy"),
//   const Genre(id: 80, name: "Crime"),
//   const Genre(id: 99, name: "Documentary"),
//   const Genre(id: 18, name: "Drama"),
//   const Genre(id: 10751, name: "Family"),
//   const Genre(id: 14, name: "Fantasy"),
//   const Genre(id: 36, name: "History"),
//   const Genre(id: 27, name: "Horror"),
//   const Genre(id: 10402, name: "Music"),
//   const Genre(id: 9648, name: "Mystery"),
//   const Genre(id: 10749, name: "Romance"),
//   const Genre(id: 878, name: "Science Fiction"),
//   const Genre(id: 10770, name: "TV Movie"),
//   const Genre(id: 53, name: "Thriller"),
//   const Genre(id: 10752, name: "War"),
//   const Genre(id: 37, name: "Western"),
// ];
