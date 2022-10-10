import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reto_patio/models/response_model.dart';
import 'package:reto_patio/repositories/api_repository.dart';

part 'items_event.dart';
part 'items_state.dart';


class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc(): super(ItemsInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetItemList>((event, emit) async {
      try {
        emit(ItemsLoading());
        final response = await apiRepository.fetchItemList(event.query);
        emit(ItemsLoaded(response));
      } on NetWorkError {
        emit(const ItemsError('Failed to fetch data, is your Devide Online?'));
      }
    });
  }
}
