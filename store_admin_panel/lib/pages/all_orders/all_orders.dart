import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/all_orders/components/large_all_orders/large_all_orders.dart';
import 'package:store_admin_panel/pages/all_orders/components/not_large_all_orders/not_large_all_orders.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDirector(
        smallWidget: NotLargeAllOrders(),
        mediumWidget: NotLargeAllOrders(),
        largeWidget: LargeAllOrders());
  }
}
