part of 'response_bloc.dart';

abstract class ResponseState extends Equatable {
  const ResponseState();

  @override
  List<Object?> get props => [];
}

class ResponseInitial extends ResponseState {}

class ResponseLoading extends ResponseState {}

class ResponseLoaded extends ResponseState {
  final ResponseModel response;
  const ResponseLoaded(this.response);
}

class ResponseError extends ResponseState {
  final String? message;
  const ResponseError(this.message);
}

