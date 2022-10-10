import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reto_patio/models/item_model.dart';
import 'package:reto_patio/repositories/api_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(): super(ItemInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetItem>((event, emit) async {
      try {
        emit(ItemLoading());
        final item = await apiRepository.fetchItem(event.itemId);
        emit(ItemLoaded(item));
      } on NetWorkError {
        emit(const ItemError('Failed to fetch data, is your Devide Online?'));
      }
    });
  }
}