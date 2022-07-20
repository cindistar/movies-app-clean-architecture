import 'package:app_example/presentation/blocs/search_movies/bloc/search_movies_bloc.dart';
import 'package:app_example/presentation/themes/theme_colors.dart';
import 'package:app_example/presentation/widgets/search_bar/custom_search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  const SearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final searchMoviesBloc = Modular.get<SearchMoviesBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchMoviesBloc,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: ThemeColors.red,
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(searchMoviesBloc),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
