part of 'testing_bloc.dart';

abstract class TestingState extends Equatable {
  const TestingState();

  @override
  List<Object> get props => [];
}

class TestingInitial extends TestingState {}

class TestingLoading extends TestingState {}

class TestingError extends TestingState {
  final String message;

  const TestingError(this.message);
  @override
  List<Object> get props => [message];
}

class TestingLoaded extends TestingState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const TestingLoaded({this.defaultIndex = 0, required this.movies});
}
