import 'package:app_example/app_module.dart';
import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/presentation/screens/watch_videos/watch_videos_arguments.dart';
import 'package:app_example/presentation/screens/watch_videos/watch_videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  setUpAll(() {
    initModules([AppModule()]);
  });

  group('watch videos screen test', () {
    testWidgets('should test these widgets below', (tester) async {
      final watchVideoArguments = WatchVideoArguments(<VideoEntity>[]);

      await tester.pumpWidget(MaterialApp(
        home: WatchVideosScreen(
          watchVideoArguments: watchVideoArguments,
        ),
      ));
      await tester.pump();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Watch trailers'), findsOneWidget);
      expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
    });
  });
}
