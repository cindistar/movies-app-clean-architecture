import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id;
  final List <int> genreIds;
  final String backdropPath;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieEntity({
    required this.genreIds, 
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.popularity,
     this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        genreIds,
        backdropPath,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount
      ];

  @override
  bool get stringify => true;
}
