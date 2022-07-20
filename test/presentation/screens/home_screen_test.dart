import 'dart:convert';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/presentation/screens/home_screen.dart';
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
  final mockHttp = MockHttpClient();

  setUpAll(() {
    initModules([
      AppModule()
    ], replaceBinds: [
      Bind.instance<HttpClient>(mockHttp),
    ]);
  });

  // arrange

  testWidgets('home screen ...', (tester) async {
    when(() => mockHttp.get(any())).thenAnswer((_) async => Response(
        statusCode: 200,
        data: json.decode(fixture(('movie_result.json'))),
        requestOptions: RequestOptions(
          path: '',
        )));

    await tester.pumpWidget(makeTestableWidget(child: const HomeScreen()));
    await tester.pump();
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
