import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;

  const MovieTabCardWidget({
    Key? key,
    required this.movieId,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to
            .pushNamed('./detail', arguments: MovieDetailArguments(movieId));
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 15,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 200,
                    child: Image.network(
                      ApiUrls.requestImage(
                        posterPath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(11),
                    topRight: Radius.circular(11)),
                child: Container(
                  height: 150,
                  width: 240,
                  color: const Color(0xFF1C1C1F),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                        child: Text(
                          title,
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            unratedColor: const Color(0xFF383536),
                            ignoreGestures: true,
                            itemSize: 18,
                            initialRating: voteAverage / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(left: 10),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              //print(rating);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 5, bottom: 5),
                            child: Text(
                              voteAverage.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: Text(
                          DateFormat('y').format(
                            DateTime.parse(
                              releaseDate,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
