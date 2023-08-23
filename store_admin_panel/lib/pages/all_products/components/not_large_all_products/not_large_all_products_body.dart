import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/product/product_templates.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class NotLargeAllProductsBody extends StatelessWidget {
  const NotLargeAllProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          TitleAndSearch(PagesNames.allProducts, true),
          Expanded(
            child: AllProductsTemplates(
              countPerLine: 4,
            ),
          )
        ],
      ),
    );
  }
}
