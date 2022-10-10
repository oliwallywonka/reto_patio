
part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

class GetItemList extends ItemsEvent {
  final String query;
  const GetItemList(this.query);
}
