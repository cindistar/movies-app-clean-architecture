import 'package:app_example/domain/entitites.dart/cast_entity.dart';
import 'package:app_example/domain/usecases/get_cast_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCastUsecase getCastUsecase;

  CastBloc(this.getCastUsecase) : super(CastInitial()) {
    on<LoadCastEvent>(getCast);
  }

  Future<void> getCast(event, emit) async {
    var getCastCrew = await getCastUsecase.call(event.movieId);
    getCastCrew.fold(
      (failure) => emit(const CastError('Something went wrong!')),
      (success) => emit(
        CastLoaded(
          casts: success,
        ),
      ),
    );
  }
}
