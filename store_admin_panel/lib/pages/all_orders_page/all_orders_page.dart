import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/pages/all_orders_page/components/large_all_orders/large_all_orders.dart';
import 'package:store_admin_panel/pages/all_orders_page/components/not_large_all_orders/not_large_all_orders.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class AllOrdersPage extends StatelessWidget {
  const AllOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Purchase> dataList = myController.dataModel.value.allPurchases;
    return ResponsiveDirector(
        smallWidget: NotLargeAllOrders(dataList: dataList),
        mediumWidget: NotLargeAllOrders(dataList: dataList),
        largeWidget: LargeAllOrders(dataList: dataList));
  }
}
