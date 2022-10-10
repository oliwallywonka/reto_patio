import 'package:flutter/material.dart';

import 'package:reto_patio/widgets/build_list_item.dart';
import 'package:reto_patio/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const SearchInput()),
      body: const BuildListItem()
    );
  }
}






