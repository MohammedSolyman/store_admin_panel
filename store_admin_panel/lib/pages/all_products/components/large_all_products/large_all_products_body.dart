import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/product/all_products_list.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class LargeAllProductsBody extends StatelessWidget {
  const LargeAllProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          TitleAndSearch(PagesNames.allProducts, false),
          Expanded(child: AllProductsList(4))
        ],
      ),
    ));
  }
}
