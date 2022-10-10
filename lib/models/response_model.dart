import 'dart:convert';

import 'package:reto_patio/models/item_model.dart';

ResponseModel responseFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    ResponseModel({
        required this.query,
        required this.paging,
        required this.results,
    });

    String? query;
    Paging paging;
    List<ItemModel> results;

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        query: json["query"],
        paging: Paging.fromJson(json["paging"]),
        results: List<ItemModel>.from(json["results"].map((x) => ItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "query": query,
        "paging": paging.toJson(),
        "results": List<ItemModel>.from(results.map((x) => x)),
    };
}

class Paging {
    Paging({
        required this.total,
        required this.primaryResults,
        required this.offset,
        required this.limit,
    });

    int total;
    int primaryResults;
    int offset;
    int limit;

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        total: json["total"],
        primaryResults: json["primary_results"],
        offset: json["offset"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "primary_results": primaryResults,
        "offset": offset,
        "limit": limit,
    };
}
