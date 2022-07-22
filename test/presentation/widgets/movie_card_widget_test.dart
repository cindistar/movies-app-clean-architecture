import 'dart:convert';
import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/presentation/widgets/genres_and_popular_movies.dart';
import 'package:app_example/presentation/widgets/movie_card_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import '../../fixtures/fixture_reader.dart';
import '../helpers/make_testable_widget.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MockHttpClient mockHttpClient = MockHttpClient();

  setUpAll(() {
    HttpOverrides.global = null;
    initModules([
      AppModule(),
    ], replaceBinds: [
      Bind.instance<HttpClient>(mockHttpClient),
    ]);
  });
  group('movie card widget screen test', () {
    testWidgets(
      "should test MovieCardWidget screen",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(
              child: const MovieCardWidget(
            movieId: 1,
          )),
        );

        await tester.pump();
        expect(find.byType(GestureDetector), findsOneWidget);
        expect(find.byType(ClipRRect), findsOneWidget);
      },
    );

    testWidgets(
      "should return error text widget when the responde is 400",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 400,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(child: const TabGenresWidget()),
        );
        await tester.pump();
        expect(find.text('Deu ruim!'), findsOneWidget);
      },
    );
  });
}
