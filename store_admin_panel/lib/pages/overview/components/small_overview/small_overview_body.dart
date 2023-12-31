import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_admin_panel/global_widgets/product/products_template.dart';
import 'package:store_admin_panel/global_widgets/purchase/latest_purchases.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class SmallOverviewBody extends StatelessWidget {
  const SmallOverviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          TitleAndSearch(PagesNames.overview, true),
          MySizedBox(),
          TwoButtoms(),
          MySizedBox(),
          MyTitle('latest products'),
          MySizedBox(),
          LatestProductsTemplates(
            countPerLine: 2,
          ),
          MySizedBox(),
          MyTitle('latest orders'),
          MySizedBox(),
          LatestPurchases()
        ],
      ),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle(
    this.txt, {
    super.key,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: Theme.of(context).textTheme.headlineLarge);
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
            },
            child: const Row(
              children: [Icon(Icons.add), Text('add product')],
            )),
      ],
    );
  }
}
