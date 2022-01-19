import 'package:equatable/equatable.dart';

class MovieSearchEntity extends Equatable {
  final String searchTerm;

  const MovieSearchEntity({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}
