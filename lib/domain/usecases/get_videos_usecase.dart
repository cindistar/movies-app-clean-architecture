import 'package:app_example/core/errors/failure.dart';
import 'package:app_example/domain/entitites.dart/video_entity.dart';
import 'package:app_example/domain/repositories/movie_repository.dart';
import 'package:app_example/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetVideosUsecase implements UseCase <VideoEntity, int> {
  final IMovieRepository repository;

  GetVideosUsecase(this.repository);

  @override
  Future<Either<Failure, List<VideoEntity>>> call(id) async {
    return await repository.getVideos(id);
  }
}