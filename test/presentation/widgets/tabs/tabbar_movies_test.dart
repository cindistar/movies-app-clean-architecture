import 'dart:convert';
import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/presentation/widgets/tabs/tabbar_movies.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../helpers/make_testable_widget.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MockHttpClient mockHttpClient = MockHttpClient();

  setUpAll(() {
    HttpOverrides.global = null;

    initModules(
      [AppModule()],
      replaceBinds: [
        Bind.instance<HttpClient>(mockHttpClient),
      ],
    );
  });

  group('tabbar movies widget screen test', () {
    testWidgets(
      "should test these widgets on the screen",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(child: const TabBarMovies()),
        );

        await tester.pump();
        expect(find.byType(DefaultTabController), findsOneWidget);
        expect(find.byType(Scaffold), findsWidgets);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(TabBar), findsWidgets);
        expect(find.byType(Tab), findsWidgets);
        expect(find.byType(TabBarView), findsOneWidget);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(Container), findsWidgets);
        expect(find.text('Top Rated'), findsOneWidget);
        expect(find.text('Soon'), findsOneWidget);
        expect(find.text('Trending'), findsOneWidget);
      },
    );
  });
}
