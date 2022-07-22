import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:app_example/presentation/blocs/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:app_example/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:app_example/presentation/widgets/movie_detail/cast_widget.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:app_example/presentation/widgets/movie_detail/videos_widget.dart';
import 'package:app_example/presentation/widgets/movie_detail_big_poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final movieDetailBloc = Modular.get<MovieDetailBloc>();
  var castBloc = Modular.get<CastBloc>();
  var videosBloc = Modular.get<VideosBloc>();

  @override
  void initState() {
    super.initState();
    movieDetailBloc.add(MovieDetailLoadEvent(widget.movieDetailArguments.movieId));
    castBloc = movieDetailBloc.castBloc;
    videosBloc = movieDetailBloc.videosBloc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: movieDetailBloc),
          BlocProvider.value(value: castBloc),
          BlocProvider.value(value: videosBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          bloc: movieDetailBloc,
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    MovieDetailBigPoster(
                      movie: movieDetail,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: double.infinity,
                      //color: Colors.red,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movieDetail.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      //color: Colors.green,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                movieDetail.releaseDate!,
                                key: const Key('movieDetail-releaseDate-key'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                ' 🔸 ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                movieDetail.status,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      //color: Colors.purple,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RatingBar.builder(
                              unratedColor: const Color(0xFF383536),
                              ignoreGestures: true,
                              itemSize: 18,
                              initialRating: movieDetail.voteAverage / 2,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                //print(rating);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              movieDetail.voteAverage.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      //height: 200,
                      width: double.infinity,
                      //color: Colors.white,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ...movieDetail.genres
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.blueGrey,
                                      child: Text(
                                        e.name[0],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    // side: const BorderSide(
                                    //   color: Colors.white,
                                    // ),
                                    elevation: 8,
                                    backgroundColor: Colors.red,
                                    shadowColor: Colors.grey,
                                    label: Text(
                                      e.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        //color: Color(0xFF333232),
                        child: Padding(
                          padding: const EdgeInsets.all(11),
                          child: Text(
                            movieDetail.overview,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CastWidget(),
                          VideosWidget(
                            videosBloc: videosBloc,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return const Text('Something went wrong!');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
