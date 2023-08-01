import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer.dart';
import 'package:store_admin_panel/pages/overview/components/my_body.dart';

class LargeOverview extends StatelessWidget {
  const LargeOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Row(
          children: [
            MyDrawer(),
            LargeOverviewBody()
          ],
        ),
      ),
    );
  }
}
