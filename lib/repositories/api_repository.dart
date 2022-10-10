import 'package:reto_patio/models/item_model.dart';
import 'package:reto_patio/models/response_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();
  Future<ResponseModel> fetchItemList(String query) {
    return _provider.fetchItemList(query);
  }

  Future<ItemModel> fetchItem(String itemId) {
    return _provider.fetchItem(itemId);
  }
}

class NetWorkError extends Error {}