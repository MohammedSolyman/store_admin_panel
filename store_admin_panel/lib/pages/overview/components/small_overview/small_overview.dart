import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/drawer/drawer.dart';
import 'package:store_admin_panel/pages/overview/components/small_overview/small_overview_body.dart';

class SmallOverview extends StatelessWidget {
  const SmallOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const SizedBox(width: 200,child: MyDrawer(),),
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(child: SmallOverviewBody()),
    );
  }
}
