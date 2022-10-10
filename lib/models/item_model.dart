// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

ItemModel itemFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
    ItemModel({
        required this.id,
        required this.title,
        required this.price,
        required this.currencyId,
        required this.availableQuantity,
        required this.permalink,
        required this.thumbnail,
        required this.tags,
        this.pictures
    });

    String id;
    String title;
    double price;
    String currencyId;
    int availableQuantity;
    String permalink;
    String thumbnail;
    List<String> tags;
    List<Picture>? pictures;

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        currencyId: json["currency_id"],
        availableQuantity: json["available_quantity"],
        permalink: json["permalink"],
        thumbnail: json["thumbnail"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        pictures: json["pictures"] == null ? null : List<Picture>.from(json["pictures"].map((x) => Picture.fromJson(x))),
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "currency_id": currencyId,
        "available_quantity": availableQuantity,
        "permalink": permalink,
        "thumbnail": thumbnail,
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}

class Picture {
    Picture({
        required this.url,
    });

    String url;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url
    };
}