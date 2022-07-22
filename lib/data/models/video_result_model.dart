import 'package:app_example/data/models/video_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class VideoResultModel extends Equatable {
  VideoResultModel({
    required this.id,
    required this.videos,
  });
  late int id;
  late List<VideoModel> videos;

  VideoResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 1;
    videos = List.from(json['results'] ?? []).map((e) => VideoModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['results'] = videos.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [id, videos];
}
