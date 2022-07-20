import 'package:app_example/app_module.dart';
import 'package:app_example/presentation/screens/movie_detail_screen.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

final movieDetailArguments = MovieDetailArguments(1);

Widget movieDetailScreenTest() {
  return MovieDetailScreen(
    movieDetailArguments: movieDetailArguments,
  );
}

void main() {
  testWidgets('should find more than one Container', (tester) async {
    await tester.pumpWidget(
      ModularApp(module: AppModule(), child: movieDetailScreenTest())
    );
    expect(find.byType(Container), findsWidgets);
  });
}
