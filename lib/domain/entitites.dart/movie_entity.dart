import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieEntity(
    this.id,
    this.backdropPath,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  );

  @override
  List<Object?> get props => [
        id,
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
