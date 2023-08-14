import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_admin_panel/global_widgets/product/latest_products.dart';
import 'package:store_admin_panel/global_widgets/texts/my_title.dart';
import 'package:store_admin_panel/global_widgets/purchase/purchase_template/purchase_template.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class LargeOverviewBody extends StatelessWidget {
  const LargeOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          TitleAndSearch(PagesNames.overview, false),
          MySizedBox(),
          TwoButtoms(),
          MySizedBox(),
          MyTitle('latest products'),
          MySizedBox(),
          LatestProduct(4),
          MySizedBox(),
          MyTitle('latest orders'),
          MySizedBox(),
          LatestPurchases()
        ],
      ),
    ));
  }
}

class TwoButtoms extends StatelessWidget {
  const TwoButtoms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: () {},
            child: const Row(
              children: [Icon(Icons.store), Text('view all')],
            )),
        ElevatedButton(
            onPressed: () {
              context.go('/addproduct');
              myController.toAddProduct(context);
            },
            child: const Row(
              children: [Icon(Icons.add), Text('add product')],
            )),
      ],
    );
  }
}
