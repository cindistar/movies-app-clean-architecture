import 'package:app_example/core/http_client/dio_implementation.dart';
import 'package:app_example/data/datasources/movie_remote_datasource.dart';
import 'package:app_example/data/repositories/movie_repository_implementation.dart';
import 'package:app_example/presentation/blocs/cubit/animation_cubit.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';

import 'package:app_example/presentation/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_now_playing_movies_usecase.dart';
import 'domain/usecases/get_popular_movies_usecase.dart';
import 'domain/usecases/get_top_rated_movies_usecase.dart';
import 'domain/usecases/get_trending_movies_usecase.dart';
import 'domain/usecases/get_upcoming_movies_usecase.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => MoviesBloc(i(), i(), i(), i(), i())),
        Bind.lazySingleton((i) => MovieRemoteDataSourceImplementation(i())),
        Bind.lazySingleton((i) => DioHttpClientImplementation()),
        Bind.lazySingleton((i) => MovieRepositoryImplementation(i())),
        Bind.lazySingleton((i) => GetNowPlayingMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetPopularMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetTopRatMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetTrendingMoviesUsecase(i())),
        Bind.lazySingleton((i) => GetUpcomingMoviesUsecase(i())),
        Bind.factory((i) => AnimationCubit()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomeScreen()),
  ];
}
