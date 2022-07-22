import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/widgets/search_bar/search_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

import '../../../entities_fake/movie_entity_fake.dart';
import '../../helpers/make_testable_widget.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;

    initModules(
      [AppModule()],
    );
  });

  group('search movie card screen', () {
    testWidgets(
      "should test widgets on the screen",
      (tester) async {
        await tester.pumpWidget(
          makeTestableWidget(
              child: const SearchMovieCard(
            movie: movieEntity,
          )),
        );

        await tester.pump();
        expect(find.byType(GestureDetector), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(ClipRRect), findsOneWidget);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(Container), findsWidgets);
      },
    );
  });
}
