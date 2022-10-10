import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reto_patio/models/response_model.dart';
import 'package:reto_patio/repositories/api_repository.dart';

part 'response_event.dart';
part 'response_state.dart';


class ResponseBloc extends Bloc<ResponseEvent, ResponseState> {
  ResponseBloc(): super(ResponseInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetResponse>((event, emit) async {
      try {
        emit(ResponseLoading());
        final response = await apiRepository.fetchItemList(event.query);
        emit(ResponseLoaded(response));
      } on NetWorkError {
        emit(const ResponseError('Failed to fetch data, is your Devide Online?'));
      }
    });
  }
}
