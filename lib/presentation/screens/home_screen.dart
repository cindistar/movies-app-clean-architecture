// ignore_for_file: sized_box_for_whitespace

import 'package:app_example/presentation/widgets/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/genres_and_popular_movies.dart';
import '../widgets/now_playing_movies_listview.dart';
import '../widgets/tabs/tabbar_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                //width: 100,
                child: NowPlayingMoviesScreen(),
              ),
              Container(
                //color: Colors.amber,
                height: 480,
                child: const TabGenresWidget(),
              ),
              Container(
                height: 720,
                //color: Colors.deepPurpleAccent,
                child: const TabBarMovies(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
