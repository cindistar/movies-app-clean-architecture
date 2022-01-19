import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
        const Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 30,
        ),
      ],
    );
  }
}
