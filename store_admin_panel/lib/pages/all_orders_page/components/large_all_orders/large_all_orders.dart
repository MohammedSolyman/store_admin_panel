import 'package:flutter/material.dart';
import 'package:store_admin_panel/data_types/purchase.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/all_orders_page/components/large_all_orders/large_all_orders_body.dart';

class LargeAllOrders extends StatelessWidget {
  const LargeAllOrders({required this.dataList, super.key});

  final List<Purchase> dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Row(
          children: [
            const MyDrawer(),
            const SizedBox(width: 15),
            LargeAllOrdersBody(
              dataList: dataList,
            )
          ],
        ),
      ),
    );
  }
}
