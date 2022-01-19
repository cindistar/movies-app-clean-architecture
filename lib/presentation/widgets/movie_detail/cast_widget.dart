// ignore_for_file: sized_box_for_whitespace

import 'package:app_example/core/utils/api_utils.dart';
import 'package:app_example/presentation/blocs/cast/bloc/cast_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 11),
            child: Container(
              //color: Colors.purple,
              height: 203,
              //width: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.casts.length,
                itemBuilder: (context, index) {
                  final castEntity = state.casts[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: CircleAvatar(
                            foregroundColor: Colors.white,
                            radius: 55,
                            backgroundImage: castEntity.posterPath == null ||
                                    castEntity.posterPath!.isEmpty
                                ? const NetworkImage(
                                    'https://www.helptechco.com/files/1215BP6.png')
                                : NetworkImage(
                                    ApiUrls.requestImage(
                                      castEntity.posterPath!,
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: const Color(0xFF221029),
                              height: 50,
                              width: 100,
                              child: Text(
                                castEntity.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
