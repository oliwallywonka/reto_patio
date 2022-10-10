import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reto_patio/models/item_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ItemDetailCard extends StatelessWidget {
  final ItemModel item;
  const ItemDetailCard({ super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Expanded(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 400),
                items: _getPictureUrls(item.pictures!).map((e) => ClipRect(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        e,
                        height: 300,
                      )
                    ],
                  ),
                )).toList(),
              ),
              Text(
                "Title: ${item.title}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                "Price: ${item.price} ${item.currencyId}",
              ),
              Text(
                "Quantity: ${item.availableQuantity}",
              ),
              Text(
                "Description: ${item.tags.map((e) => '${e}, ')}",
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl(item.permalink);
                },
                child: const Text(
                  "Visit Page",
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  List<String> _getPictureUrls (List<Picture> pictures) {
    List<String> urls = [];
    for (var picture in pictures) {
      urls.add(picture.url);
    }
    return urls;
  }
}