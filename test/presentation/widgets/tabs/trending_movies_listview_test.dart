import 'dart:convert';
import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/presentation/widgets/tabs/top_rated_movies_listview.dart';
import 'package:app_example/presentation/widgets/tabs/trending_movies_listview.dart';
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
    initModules([
      AppModule()
    ], replaceBinds: [
      Bind.instance<HttpClient>(mockHttpClient),
    ]);
  });

  group('trending movies listview screen test', () {
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
          makeTestableWidget(child: const TrendingMoviesListView()),
        );
        await tester.pump();
        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(Builder), findsWidgets);
      },
    );

    testWidgets(
      "should display error text widget when the response is 400,",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 400,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(child: const TopRatedMoviesListView()),
        );
        await tester.pump();
        expect(find.text('Deu ruim!'), findsOneWidget);
      },
    );
  });
}
