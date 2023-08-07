import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Row(
          children: [
            MyDrawer(),
            SizedBox(width: 15),
            Center(
              child: Text('all orders'),
            )
          ],
        ),
      ),
    );
  }
}
