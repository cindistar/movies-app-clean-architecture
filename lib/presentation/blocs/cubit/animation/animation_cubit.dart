import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(AnimationInitial());

  var onClickAnimate = false;

  var nowPlayingAnimation = false;

  bool animation() {
    return onClickAnimate = !onClickAnimate;
  }

  bool nowPlaying() {
    return nowPlayingAnimation = !nowPlayingAnimation;
  }

}
