import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';

Widget modular() {
  return ModularApp(
    module: AppModule(),
    child: const MaterialApp(home: HomeScreen()),
  );
}

void main() {
  setUpAll(() {
    initModules([AppModule(), AppModule()]);
  });

  testWidgets('home screen ...', (tester) async {
    await tester.pumpWidget(modular());
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
