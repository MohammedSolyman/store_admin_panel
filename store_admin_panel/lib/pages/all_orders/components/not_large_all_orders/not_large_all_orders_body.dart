import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/global_widgets/purchase/all_purchases_list.dart';
import 'package:store_admin_panel/global_widgets/title_and_search/title_and_search.dart';

class NotLargeAllOrdersBody extends StatelessWidget {
  const NotLargeAllOrdersBody({required this.dataList, super.key});

  final List<Purchase> dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          const TitleAndSearch(PagesNames.allOrders, true),
          AllPurchasesList(dataList: dataList)
        ],
      ),
    );
  }
}
