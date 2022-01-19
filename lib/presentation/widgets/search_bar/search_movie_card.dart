// ignore_for_file: sized_box_for_whitespace

import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/domain/entitites.dart/movie_entity.dart';
import 'package:app_example/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          './detail',
          arguments: MovieDetailArguments(
            movie.id!,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 5,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: SizedBox(
                  height: 160,
                  width: 110,
                  child: movie.posterPath == null
                      ? Image.network(
                          'https://www.helptechco.com/files/1215BP6.png',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          ApiUrls.requestImage(
                            movie.posterPath!,
                          ),
                        ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  //color: Colors.red,
                  height: 60,
                  width: 214,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                ),
                Container(
                  //color: Colors.green,
                  height: 100,
                  width: 253,
                  child: Text(
                    movie.overview,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
