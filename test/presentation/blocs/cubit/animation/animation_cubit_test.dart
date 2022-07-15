import 'package:app_example/presentation/blocs/cubit/animation/animation_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AnimationCubit animationCubit;

  setUp(() {
    animationCubit = AnimationCubit();
  });

  test(
    'animationCubit should have initial state as [AnimationInitial]',
    () {
      expect(animationCubit.state.runtimeType, AnimationInitial);
    },
  );

  test(
    'animation function should be of bool type',
    () {
      expect(animationCubit.animation(), isA<bool>());
    },
  );

  test(
    'nowPlaying function should be of bool type ',
    () {
      expect(animationCubit.nowPlaying(), isA<bool>());
    },
  );
}
