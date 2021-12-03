import 'package:app_example/presentation/controllers/bloc/testing_bloc.dart';
import 'package:app_example/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final bloc = Modular.get<TestingBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const SearchBar(),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.4,
              child: BlocBuilder<TestingBloc, TestingState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is TestingError) {
                    return Text(state.message);
                  } else if (state is TestingLoaded) {
                    return ListView.builder(
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(
                              state.movies[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        });
                  }
                  return Container();
                },
              ),
            ),
            // const FractionallySizedBox(
            //   alignment: Alignment.bottomCenter,
            //   heightFactor: 0.6,
            //   child: Placeholder(
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
