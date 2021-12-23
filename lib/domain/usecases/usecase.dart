import 'package:app_example/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Type: what the usecase return (Output)
// Params: what is required to call API (Input)

abstract class UseCase<Output, Input> {
  Future<Either<Failure, List<Output>>> call(Input params);
}

class NoParams extends Equatable {
  
  @override
  List<Object> get props => [];

}