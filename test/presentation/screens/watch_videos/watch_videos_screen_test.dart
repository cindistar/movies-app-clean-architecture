import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/presentation/screens/watch_videos/watch_videos_arguments.dart';
import 'package:app_example/presentation/screens/watch_videos/watch_videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final watchVideoArguments = WatchVideoArguments(<VideoEntity>[]);
Widget test() {
  return MaterialApp(home: WatchVideosScreen(watchVideoArguments: watchVideoArguments));
}

void main() {
  testWidgets('watch videos screen ...', (tester) async {
    await tester.pumpWidget(WatchVideosScreen(
      watchVideoArguments: watchVideoArguments,
    ));
    expect(find.text('Watch trailers'), findsOneWidget);
  });
}
