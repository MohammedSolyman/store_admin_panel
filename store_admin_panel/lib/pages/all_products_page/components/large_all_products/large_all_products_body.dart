import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/product/products_template.dart';
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
          Expanded(
            child: AllProductsTemplates(
              countPerLine: 4,
            ),
          )
        ],
      ),
    ));
  }
}
