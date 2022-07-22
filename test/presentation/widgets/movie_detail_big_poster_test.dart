import 'dart:convert';
import 'dart:io';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_appbar.dart';
import 'package:app_example/presentation/widgets/movie_detail_big_poster.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import '../../entities_fake/movie_detail_entity_fake.dart';
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
  group('movie detail big poster widget screen test', () {
    testWidgets(
      "should test MovieDetailBigPoster screen",
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
              child: const MovieDetailBigPoster(
            movie: movieDetailEntity,
          )),
        );

        await tester.pump();
        expect(find.byType(Stack), findsOneWidget);
        expect(find.byType(Container), findsOneWidget);
        expect(find.byType(ClipRRect), findsOneWidget);
        expect(find.byType(Positioned), findsOneWidget);
        expect(find.byType(MovieDetailAppBar), findsOneWidget);
      },
    );
  });
}
