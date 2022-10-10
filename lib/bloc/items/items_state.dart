part of 'items_bloc.dart';

abstract class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object?> get props => [];
}

class ItemsInitial extends ItemsState {}

class ItemsLoading extends ItemsState {}

class ItemsLoaded extends ItemsState {
  final ResponseModel response;
  const ItemsLoaded(this.response);
}

class ItemsError extends ItemsState {
  final String? message;
  const ItemsError(this.message);
}
