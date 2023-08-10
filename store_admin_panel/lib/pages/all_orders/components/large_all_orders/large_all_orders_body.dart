import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/purchase/all_purchases_list.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class LargeAllOrdersBody extends StatelessWidget {
  const LargeAllOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: const Column(
        children: [
          TitleAndSearch(PagesNames.allOrders, false),
          AllPurchasesList()
        ],
      ),
    ));
  }
}
