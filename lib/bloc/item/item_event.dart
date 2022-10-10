part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetItem extends ItemEvent {
  final String itemId;
  const GetItem(this.itemId);
}

