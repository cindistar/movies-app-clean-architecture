import 'package:app_example/presentation/themes/theme_colors.dart';
import 'package:app_example/presentation/widgets/tabs/top_rated_movies_listview.dart';
import 'package:app_example/presentation/widgets/tabs/trending_movies_listview.dart';
import 'package:app_example/presentation/widgets/tabs/upcoming_soon_movies_listview.dart';
import 'package:flutter/material.dart';

class TabBarMovies extends StatefulWidget {
  const TabBarMovies({Key? key}) : super(key: key);

  @override
  TabBarMoviesState createState() => TabBarMoviesState();
}

class TabBarMoviesState extends State<TabBarMovies> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            indicatorWeight: 6,
            indicatorColor: ThemeColors.red,
            labelStyle: const TextStyle(
              fontSize: 18,
            ),
            tabs: [
              Padding(
                padding: const EdgeInsets.only(bottom:20),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  //color: Colors.deepPurpleAccent,
                  child: const Tab(
                    text: 'Top Rated',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:20),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  //color: Colors.deepPurpleAccent,
                  child: const Tab(
                    text: 'Soon',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:20),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  //color: Colors.deepPurpleAccent,
                  child: const Tab(
                    text: 'Trending',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TopRatedMoviesListView(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: UpcomingSoonMoviesListView(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TrendingMoviesListView(),
            ),
          ],
        ),
      ),
    );
  }
}
