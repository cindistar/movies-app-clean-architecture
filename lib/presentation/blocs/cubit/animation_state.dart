part of 'animation_cubit.dart';

abstract class AnimationState extends Equatable {
  const AnimationState();

  @override
  List<Object> get props => [];
}

class AnimationInitial extends AnimationState {}
