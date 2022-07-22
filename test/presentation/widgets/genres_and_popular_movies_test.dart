import 'dart:convert';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/presentation/widgets/genres_and_popular_movies.dart';
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
    initModules([
      AppModule(),
    ], replaceBinds: [
      Bind.instance<HttpClient>(mockHttpClient),
    ]);
  });
  group('search bar screen test', () {
    testWidgets(
      "should return these widgets when the responde is 200",
      (tester) async {
        when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(path: ''),
          ),
        );

        await tester.pumpWidget(
          makeTestableWidget(child: const TabGenresWidget()),
        );

        await tester.pump();
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(ListView), findsWidgets);
        expect(find.text('Popular'), findsOneWidget);
        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(Text), findsOneWidget);
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
