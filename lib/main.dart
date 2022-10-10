import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reto_patio/bloc/item/item_bloc.dart';

import 'package:reto_patio/bloc/response/response_bloc.dart';

import 'package:reto_patio/pages/detail_page.dart';
import 'package:reto_patio/pages/history_page.dart';
import 'package:reto_patio/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ResponseBloc()),
        BlocProvider(create: (context) => ItemBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: 'searchPage',
        routes: {
          'searchPage': ( _ ) => const SearchPage(),
          'detailPage': ( _ ) => const DetailPage(),
          'historyPage': ( _ ) => const HistoryPage()
        },
      ),
    );
  }
}