import 'package:equatable/equatable.dart';

class SearchParams extends Equatable {
  final String searchText;

  const SearchParams({required this.searchText});

  @override
  List<Object?> get props => [searchText];
}
