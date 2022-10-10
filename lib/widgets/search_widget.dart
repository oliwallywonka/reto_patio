import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reto_patio/bloc/items/items_bloc.dart';
import 'package:reto_patio/helpers/debounce.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});
  @override
  Widget build(BuildContext context) {
  final itemsBloc = BlocProvider.of<ItemsBloc>(context, listen: false);
  final Debounce debounce = Debounce(delay: 500);
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        onChanged: (text) {
          debounce.run(() {
            itemsBloc.add(GetItemList(text));
          });
        },
      ),
    );
  }
}