import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/overview/components/large_overview/large_overview_body.dart';

class LargeOverview extends StatelessWidget {
  const LargeOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body:  Center(
        child: Row(
          children: [
            MyDrawer(),
            SizedBox(width: 15),
            LargeOverviewBody()
          ],
        ),
      ),
    );
  }
}
