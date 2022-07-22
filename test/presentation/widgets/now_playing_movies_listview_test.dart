import 'dart:convert';
import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart' as core_http_client;
import 'package:app_example/presentation/widgets/now_playing_movies_listview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import '../../fixtures/fixture_reader.dart';
import '../helpers/make_testable_widget.dart';

class MockHttpClient extends Mock implements core_http_client.HttpClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MockHttpClient mockHttpClient = MockHttpClient();

  setUpAll(() {
    HttpOverrides.global = null;
    initModules([
      AppModule()
    ], replaceBinds: [
      Bind.instance<core_http_client.HttpClient>(mockHttpClient),
    ]);
  });

  group('movie detail screen test', () {
    testWidgets(
      "should display these widgets when the response is 200 (success)",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(child: const NowPlayingMoviesScreen()),
        );
        await tester.pump();
        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(Stack), findsWidgets);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(Positioned), findsWidgets);
        expect(find.byType(GestureDetector), findsWidgets);
        expect(find.byType(ClipRRect), findsOneWidget);
        expect(find.text('Now playing'), findsOneWidget);
      },
    );

    testWidgets(
      "should find AnimatedContainer widgets",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(child: const NowPlayingMoviesScreen()),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 700));
        expect(find.byType(AnimatedContainer), findsWidgets);
      },
    );
  });

  testWidgets(
    "should show error text widget when the response is 400",
    (tester) async {
      when(() => mockHttpClient.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 400,
          data: json.decode(fixture(('movie_result.json'))),
          requestOptions: RequestOptions(path: ''),
        ),
      );

      await tester.pumpWidget(
        makeTestableWidget(child: const NowPlayingMoviesScreen()),
      );
      await tester.pump();
      expect(find.text('Deu ruim!'), findsOneWidget);
    },
  );
}
