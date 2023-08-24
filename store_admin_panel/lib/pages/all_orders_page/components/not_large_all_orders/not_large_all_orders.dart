import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/all_orders_page/components/not_large_all_orders/not_large_all_orders_body.dart';

class NotLargeAllOrders extends StatelessWidget {
  const NotLargeAllOrders({required this.dataList, super.key});

  final List<Purchase> dataList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SizedBox(
        width: 200,
        child: MyDrawer(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(child: NotLargeAllOrdersBody(dataList: dataList)),
    );
  }
}
