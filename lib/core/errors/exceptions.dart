import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException(this.message);
  @override
  List<Object> get props => [message];
}