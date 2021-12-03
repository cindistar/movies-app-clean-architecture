import 'dart:convert';

class GenreModel {
    GenreModel({
        required this.genres,
    });

    final List<Genre> genres;

    factory GenreModel.fromJson(String str) => GenreModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenreModel.fromMap(Map<String, dynamic> json) => GenreModel(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
    };
}

class Genre {
    Genre({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
