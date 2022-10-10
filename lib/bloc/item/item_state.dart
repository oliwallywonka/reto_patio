part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object?> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final ItemModel item;
  const ItemLoaded(this.item);
}

class ItemError extends ItemState {
  final String? message;
  const ItemError(this.message);
}
