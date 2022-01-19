import 'package:app_example/presentation/blocs/search_movies/bloc/search_movies_bloc.dart';
import 'package:app_example/presentation/widgets/search_bar/search_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w600),
          focusedBorder: InputBorder.none,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : Colors.red,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(SearchTextEvent(query));

    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMoviesError) {
          return const Text('Something went wrong!');
        } else if (state is SearchMoviesLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return const Center(
              child: Text(
                'Movie not found. Try again!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index],
            ),
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
