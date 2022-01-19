import 'package:app_example/domain/entitites.dart/genre_entity.dart';
import 'package:app_example/presentation/blocs/genres_bloc/genre_bloc.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';
import 'package:app_example/presentation/themes/theme_colors.dart';
import 'package:app_example/presentation/widgets/movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app_example/core/utils/string_extension_greater_15.dart';

class TabGenresWidget extends StatefulWidget {
  const TabGenresWidget({Key? key}) : super(key: key);

  @override
  _TabGenresWidgetState createState() => _TabGenresWidgetState();
}

class _TabGenresWidgetState extends State<TabGenresWidget> {
  int selectedGenre = 0;

  final bloc = Modular.get<GenreBloc>();
  final moviesBloc = Modular.get<MoviesBloc>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(GenreTapEventStarted());
    moviesBloc.add(GetMovieByGenreEvent(selectedGenre, ''));
    _scrollController.addListener(
      () {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels != 0) {
            moviesBloc.add((GetMovieByGenreEvent(selectedGenre, '')));
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    moviesBloc.close();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenreBloc>(
          create: (_) => bloc,
        ),
        BlocProvider<MoviesBloc>(
          create: (context) => moviesBloc,
        )
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GenreBloc, GenreState>(
            builder: (context, state) {
              if (state is GenreLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GenreLoaded) {
                List<GenreEntity> genres = state.genreList;
                return SizedBox(
                  height: 60,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      GenreEntity genre = genres[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                GenreEntity genre = genres[index];
                                selectedGenre = genre.id;
                                moviesBloc.add((GetMovieByGenreEvent(
                                  selectedGenre,
                                  '',
                                )));
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ThemeColors.deepBlack,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: (genre.id == selectedGenre)
                                    ? ThemeColors.red
                                    : const Color(0xFF333338),
                              ),
                              child: Text(
                                genre.genreName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: (genre.id == selectedGenre)
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Popular',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesError) {
                return const Center(
                  child: Text('Deu ruim!'),
                );
              } else if (state is MoviesLoaded) {
                //_moviesList.addAll(state.movies);
                return SizedBox(
                  //color: Colors.green,
                  height: 360,
                  child: ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) => const VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 360,
                        //color: Colors.red,
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 11),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: SizedBox(
                                  height: 300,
                                  child: SizedBox(
                                    child: MovieCardWidget(
                                      movieId: state.movies[index].id!,
                                      posterPath:
                                          state.movies[index].posterPath!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 20,
                              //color: Colors.cyan,
                              child: Text(
                                state.movies[index].title.wordTrim15(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              //color: Colors.purple,
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    unratedColor: const Color(0xFF383536),
                                    ignoreGestures: true,
                                    itemSize: 18,
                                    initialRating:
                                        state.movies[index].voteAverage / 2,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      //print(rating);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      state.movies[index].voteAverage.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (state is MoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
