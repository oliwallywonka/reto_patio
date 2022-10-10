import 'package:flutter/material.dart';
import 'package:reto_patio/models/response_model.dart';

class BuildItemsCard extends StatelessWidget {
  final ResponseModel response;
  const BuildItemsCard({super.key, required this.response});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Result for: ${response.query}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: response.results.length,
            itemBuilder: (context, index) {
              return ItemCard(response: response, index: index);
            }
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.response,
    required this.index
  }) : super(key: key);

  final ResponseModel response;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Image.network(
                  response.results[index].thumbnail,
                  height: 100,
                )
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Title: ${response.results[index].title}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      "Price: ${response.results[index].price} ${response.results[index].currencyId}",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}