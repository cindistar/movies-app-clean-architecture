import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/presentation/blocs/genres_bloc/genre_bloc.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';
import 'package:app_example/presentation/widgets/tabs/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TopRatedMoviesListView extends StatefulWidget {
  const TopRatedMoviesListView({Key? key}) : super(key: key);

  @override
  State<TopRatedMoviesListView> createState() => _TopRatedMoviesListViewState();
}

class _TopRatedMoviesListViewState extends State<TopRatedMoviesListView> {
  final List<MovieEntity> _movies = [];
  final ScrollController _scrollController = ScrollController();

  final bloc = Modular.get<MoviesBloc>();
  final genrebloc = Modular.get<GenreBloc>();

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(GetTopRatedMoviesEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          bloc.add(GetTopRatedMoviesEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MoviesBloc>(
            create: (context) => bloc,
          ),
          BlocProvider<GenreBloc>(
            create: (context) => genrebloc,
          ),
        ],
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
                return Column(
                  children: [
                    MovieTabCardWidget(
                      movieId: movie.id!,
                      title: movie.title,
                      posterPath: movie.posterPath!,
                      voteAverage: movie.voteAverage,
                      releaseDate: movie.releaseDate,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
