import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';
import 'package:app_example/presentation/widgets/tabs/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrendingMoviesListView extends StatefulWidget {
  const TrendingMoviesListView({Key? key}) : super(key: key);

  @override
  State<TrendingMoviesListView> createState() => _TrendingMoviesListViewState();
}

class _TrendingMoviesListViewState extends State<TrendingMoviesListView> {
  final List<MovieEntity> _movies = [];
  final ScrollController _scrollController = ScrollController();

  final bloc = Modular.get<MoviesBloc>();

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(GetTrendingMoviesEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          bloc.add(GetTrendingMoviesEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MoviesBloc>(
        create: (context) => bloc,
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesInitial ||
                state is MoviesLoading && _movies.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MoviesLoaded) {
              _movies.addAll(state.movies);
            } else if (state is MoviesError) {
              return const Text('Deu ruim!');
            }
            return ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: _movies.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (context, index) {
                final MovieEntity movie = _movies[index];
                return Builder(
                  builder: (context) {
                    return MovieTabCardWidget(
                      movieId: movie.id!,
                      title: movie.title,
                      posterPath: movie.posterPath!,
                      voteAverage: movie.voteAverage,
                      releaseDate: movie.releaseDate,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
