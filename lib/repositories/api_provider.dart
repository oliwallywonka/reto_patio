import 'package:dio/dio.dart';
import 'package:reto_patio/models/item_model.dart';

import '../models/response_model.dart';


class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.mercadolibre.com';

  Future<ResponseModel> fetchItemList(String query) async {
    try {
      Response response = await _dio.get('$_url/sites/MLU/search?q=$query#json');
      return ResponseModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception: $error stackTrace: $stacktrace");
      throw Exception('Failed to fetch Items');
    }
  }

  Future<ItemModel> fetchItem(String itemId) async {
    try {
      Response response = await _dio.get('$_url/items/$itemId#json');
      return ItemModel.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception: $error stackTrace: $stacktrace");
      throw Exception('Failed to fetch Item');
    }
  }
}