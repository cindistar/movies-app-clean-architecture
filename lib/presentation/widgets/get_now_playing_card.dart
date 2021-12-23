import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/presentation/blocs/cubit/animation_cubit.dart';
import 'package:app_example/presentation/blocs/movies/movies_bloc.dart';
import 'package:app_example/presentation/widgets/movie_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GetNowPlayingCard extends StatefulWidget {
  const GetNowPlayingCard({Key? key}) : super(key: key);

  @override
  State<GetNowPlayingCard> createState() => _HomePageState();
}

class _HomePageState extends State<GetNowPlayingCard> {
  final List<MovieEntity> _listMovies = [];
  final ScrollController _scrollController = ScrollController();

  final bloc = Modular.get<MoviesBloc>();
  final cubit = Modular.get<AnimationCubit>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetNowPlayingMoviesvent());
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          bloc.add(GetNowPlayingMoviesvent());
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (_) => bloc,
      child: Scaffold(
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesInitial ||
                state is MoviesLoading && _listMovies.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MoviesLoaded) {
              _listMovies.addAll(state.movies);
            } else if (state is MoviesError) {
              return const Text('Deu ruim!');
            }
            return Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: _listMovies.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              cubit.animation();
                            });
                          },
                          child: AnimatedContainer(
                            height: cubit.onClickAnimate ? 220 : 150,
                            width: cubit.onClickAnimate ? 150 : 220,
                            color: Colors.blue,
                            duration: const Duration(milliseconds: 700),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 13,
                                left: 0,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: MovieCardWidget(
                                  movieId: _listMovies[index].id!,
                                  posterPath: _listMovies[index].posterPath,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  bottom: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        cubit.nowPlaying();
                      });
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: cubit.nowPlayingAnimation ? 40 : 40,
                        width: cubit.nowPlayingAnimation ? 100 : 15,
                        color: const Color(0xffe11a38),
                        child: AnimatedCrossFade(
                          firstChild: const Center(
                            child: Text(
                              'Now playing',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          secondChild: Container(),
                          crossFadeState: cubit.nowPlayingAnimation
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 100),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
