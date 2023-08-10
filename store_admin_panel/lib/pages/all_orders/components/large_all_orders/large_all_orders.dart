import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/all_orders/components/large_all_orders/large_all_orders_body.dart';

class LargeAllOrders extends StatelessWidget {
  const LargeAllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Row(
          children: [MyDrawer(), SizedBox(width: 15), LargeAllOrdersBody()],
        ),
      ),
    );
  }
}
