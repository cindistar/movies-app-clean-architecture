

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

}

class ServerFailure extends Failure {

  @override
  List<Object?> get props => [];
}
class InvalidPageFailure extends Failure {
  final String message;

  InvalidPageFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class NullParamFailure extends Failure {
  @override
  List<Object?> get props => [];
}