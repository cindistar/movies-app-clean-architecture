// ignore_for_file: annotate_overrides

import 'package:app_example/domain/entitites.dart/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  }) : super(
          title: name,
          key: key,
          type: type,
        );
  final String iso_639_1;
  final String iso_3166_1;
  final String name;
  // ignore: overridden_fields
  final String key;
  final String site;
  final int size;
  // ignore: overridden_fields
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        iso_639_1: json['iso_639_1'],
        iso_3166_1: json['iso_3166iso_3166_1'] ?? '',
        name: json['name'],
        key: json['key'] ?? 'PnJY20UCH9c',
        site: json['site'],
        size: json['size'],
        type: json['type'],
        official: json['official'],
        publishedAt: json['published_at'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['iso_639_1'] = iso_639_1;
    _data['iso_3166_1'] = iso_3166_1;
    _data['name'] = name;
    _data['key'] = key;
    _data['site'] = site;
    _data['size'] = size;
    _data['type'] = type;
    _data['official'] = official;
    _data['published_at'] = publishedAt;
    _data['id'] = id;
    return _data;
  }

  @override
  String toString() {
    return 'VideoModel(iso_639_1: $iso_639_1, iso_3166_1: $iso_3166_1, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt, id: $id)';
  }
}
