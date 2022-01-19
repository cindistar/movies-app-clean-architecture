// ignore_for_file: sized_box_for_whitespace

import 'package:app_example/presentation/blocs/cubit/animation/animation_cubit.dart';
import 'package:app_example/presentation/widgets/now_playing_movies_listview.dart';
import 'package:app_example/presentation/widgets/search_bar/search_bar.dart';
import 'package:app_example/presentation/widgets/genres_and_popular_movies.dart';
import 'package:app_example/presentation/widgets/tabs/tabbar_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final cubit = Modular.get<AnimationCubit>();


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
