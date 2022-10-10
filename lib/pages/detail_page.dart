import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reto_patio/bloc/item/item_bloc.dart';
import 'package:reto_patio/bloc/response/response_bloc.dart';
import 'package:reto_patio/widgets/cards/item_detail_card.dart';
import 'package:reto_patio/widgets/loading_indicator.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle Item')) ,
      body:  Container(
        child: BlocBuilder<ItemBloc, ItemState> (
          builder: (context, state) {
            if (state is ItemInitial) {
              return const Center(child:  Text('No item to show'));
            } else if (state is ItemLoading) {
              return const LoadingIndicator();
            } else if (state is ItemLoaded) {
              return ItemDetailCard(item: state.item);
            } else if (state is ItemError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!)),
              );
              return const Center( child: Text('Error State'),);
            } else {
              return const Center( child: Text('Default State'),);
            }
          },
        ),
      ),
    );
  }
}