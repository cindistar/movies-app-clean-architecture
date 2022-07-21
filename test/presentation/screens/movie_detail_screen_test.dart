import 'dart:convert';

import 'package:app_example/app_module.dart';
import 'package:app_example/core/http_client/http_client.dart';
import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:app_example/presentation/blocs/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:app_example/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:app_example/presentation/screens/movie_detail_screen.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import '../../entities_fake/movie_detail_entity_fake.dart';
import '../../fixtures/fixture_reader.dart';
import '../helpers/make_testable_widget.dart';

class MockCastBloc extends MockBloc<CastEvent, CastState> implements CastBloc {}

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState> implements MovieDetailBloc {}

class MockVideosBloc extends MockBloc<VideosEvent, VideosState> implements VideosBloc {}

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  final mockHttp = MockHttpClient();
  final mockCastBloc = MockCastBloc();
  final mockMovieDetailBloc = MockMovieDetailBloc();
  final mockVideosBloc = MockVideosBloc();
  setUpAll(() {
    initModules([
      AppModule()
    ], replaceBinds: [
      Bind.instance<HttpClient>(mockHttp),
      Bind.instance<CastBloc>(mockCastBloc),
      Bind.instance<MockMovieDetailBloc>(mockMovieDetailBloc),
      Bind.instance<VideosBloc>(mockVideosBloc)
    ]);
  });

  group('movie detail screen test', () {
    testWidgets(
      "should test..,",
      (tester) async {
        when(() => mockHttp.get(any())).thenAnswer((_) async => Response(
            statusCode: 200,
            data: json.decode(fixture(('movie_result.json'))),
            requestOptions: RequestOptions(
              path: '',
            )));

        when(() => mockCastBloc.state).thenReturn(const CastLoaded(casts: <CastEntity>[]));

        when(() => mockMovieDetailBloc.state).thenReturn(const MovieDetailLoaded(movieDetailEntity: movieDetailEntity));

       when(() => mockVideosBloc.state).thenReturn(const VideosLoaded(videos: <VideoEntity>[]));

        await tester.pumpWidget(makeTestableWidget(
            child: MovieDetailScreen(
          movieDetailArguments: MovieDetailArguments(1),
        )));
        expect(find.byType(SingleChildScrollView), findsOneWidget);
      },
    );
  });
}
