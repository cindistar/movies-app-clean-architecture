import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/widgets/tabs/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import '../../helpers/make_testable_widget.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;

    initModules(
      [AppModule()],
    );
  });

  group('movie tab card widget screen test', () {
    testWidgets(
      "should test these widgets on the screen",
      (tester) async {
        await tester.pumpWidget(
          makeTestableWidget(
              child: MovieTabCardWidget(
            movieId: 1,
            posterPath: '',
            title: '',
            voteAverage: 2.2,
            releaseDate: DateTime.now().toString(),
          )),
        );

        await tester.pump();
        expect(find.byType(GestureDetector), findsWidgets);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Container), findsWidgets);
        expect(find.byType(ClipRRect), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
      },
    );
  });
}
