import 'package:app_example/core/utils/api_utils.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: Image.network(
        ApiUrls.requestImage(
          posterPath,
        ),
        fit: BoxFit.cover,
      ),
    );
   
  }
}
