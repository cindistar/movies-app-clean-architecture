import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import '../../helpers/make_testable_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    initModules([
      AppModule(),
    ]);
  });
  group('search bar screen test', () {
    testWidgets(
      "should find these widgets on the screen",
      (tester) async {
        await tester.pumpWidget(
          makeTestableWidget(child: Material(child: SearchBar())),
        );

        await tester.pumpAndSettle();
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(ClipRRect), findsOneWidget);
        expect(find.byType(Container), findsOneWidget);
        expect(find.byType(IconButton), findsOneWidget);
      },
    );

    testWidgets(
      "iconButton with Icon clicked",
      (tester) async {
        await tester.pumpWidget(
          makeTestableWidget(child: Material(child: SearchBar())),
        );
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
        expect(find.byType(Icon), findsNWidgets(2));
      },
    );
  });
}
