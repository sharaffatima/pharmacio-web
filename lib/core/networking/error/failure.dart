import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);
}
