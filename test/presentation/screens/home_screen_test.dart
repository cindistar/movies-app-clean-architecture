import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/screens/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

class DioMock extends Mock implements Dio {}

Widget modular() {
  return const MaterialApp(
    home: HomeScreen(),
  );
}

void main() {
  //final dioMock = DioMock();

  setUpAll(() {
    initModules([AppModule()]);
  });

  testWidgets('home screen ...', (tester) async {
    await tester.pumpWidget(modular());
    await tester.pumpAndSettle();
    //expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
