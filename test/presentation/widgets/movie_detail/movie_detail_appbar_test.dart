import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import '../../helpers/make_testable_widget.dart';

void main() {
  setUpAll(() {
    initModules(
      [AppModule()],
    );
  });
  group('movie detail app bar screen test', () {
    testWidgets('should test widgets from the screen', (tester) async {
      await tester.pumpWidget(makeTestableWidget(child: const MovieDetailAppBar()));
      await tester.pump();
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));
    });
  });
}
