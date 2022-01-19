part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> casts;

  const CastLoaded({required this.casts});

  @override
  List<Object> get props => [casts];
}

class CastError extends CastState {
  final String message;

  const CastError(this.message);

   @override
  List<Object> get props => [message];
}
