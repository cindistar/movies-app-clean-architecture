import 'package:app_example/presentation/blocs/cubit/animation_cubit.dart';
import 'package:app_example/presentation/widgets/get_now_playing_card.dart';
import 'package:app_example/presentation/widgets/search_bar.dart';
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
        child: GestureDetector(
          onDoubleTap: () {
            setState(() {
              cubit.animation();
            });
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
               const SizedBox(
                  height: 220,
                  child: GetNowPlayingCard(),
                ),
                Container(
                  height: cubit.onClickAnimate ? 220 : 150,
                  width: double.infinity,
                  color: Colors.amber,
                ),
                Container(
                  color: Colors.pink,
                  height: 400,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
