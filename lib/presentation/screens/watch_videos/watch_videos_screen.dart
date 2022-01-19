// ignore_for_file: sized_box_for_whitespace

import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/presentation/screens/watch_videos/watch_videos_arguments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideosScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;
  const WatchVideosScreen({Key? key, required this.watchVideoArguments})
      : super(key: key);

  @override
  _WatchVideosScreenState createState() => _WatchVideosScreenState();
}

class _WatchVideosScreenState extends State<WatchVideosScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Colors.blue,
        elevation: 3,
        title: const Text(
          'Watch trailers',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < _videos.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 11, right: 11, top: 11),
                          child: Container(
                            //color: Colors.green,
                            height: 140,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _controller.load(_videos[i].key);
                                    _controller.play();
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: _videos[i].key,
                                      quality: ThumbnailQuality.high,
                                      webp: false,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset("assets/no_image.png"),
                                  ),
                                ),
                                Expanded(
                                  //flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      _videos[i].title,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String getThumbnail({
    required String videoId,
    String quality = ThumbnailQuality.standard,
    bool webp = true,
  }) =>
      webp
          ? 'https://i3.ytimg.com/vi_webp/$videoId/$quality.webp'
          : 'https://i3.ytimg.com/vi/$videoId/$quality.jpg';
}
