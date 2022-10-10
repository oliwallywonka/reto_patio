import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reto_patio/bloc/response/response_bloc.dart';
import 'package:reto_patio/widgets/cards/build_items_card.dart';
import 'package:reto_patio/widgets/loading_indicator.dart';

class BuildListItem extends StatelessWidget {
  
  const BuildListItem({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocBuilder<ResponseBloc, ResponseState>(
        builder: (context, state) {
          if (state is ResponseInitial) {
            return const Center(child:  Text('Type something to search...'));
          } else if (state is ResponseLoading) {
            return const LoadingIndicator();
          } else if (state is ResponseLoaded) {
            if (state.response.results.isEmpty) {
              return const Center(child: Text('No Results Type a diferent thing'));
            }
            return BuildResponseCard(response: state.response);
          } else if (state is ResponseError ){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message!)),
            );
            return const Center( child: Text('Error State'),);
          } else {
            return const Center( child: Text('Default State'),);
          }
        }
      ),
    );
  }
}
