import 'package:reto_patio/models/response_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();
  Future<ResponseModel> fetchItemList(String query) {
    return _provider.fetchItemList(query);
  }
}

class NetWorkError extends Error {}