import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final int id;
  final String genreName;

  const GenreEntity({
    required this.id,
    required this.genreName,
  });

  @override
  List<Object?> get props => [
        id,
        genreName,
      ];

  @override
  bool get stringify => true;
}
