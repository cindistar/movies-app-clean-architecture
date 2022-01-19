part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();

  @override
  List<Object> get props => [];
}

class LoadCastEvent extends CastEvent {
  final int movieId;

  const LoadCastEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
