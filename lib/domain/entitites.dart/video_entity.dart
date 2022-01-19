import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String title;
  final String key;
  final String type;

  const VideoEntity({
    required this.title,
    required this.key,
    required this.type,
  });

  @override
  List<Object?> get props => [title, key, type];

  @override
  bool get stringify => true;
}
