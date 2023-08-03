import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/overview/components/large_overview.dart';
import 'package:store_admin_panel/pages/overview/components/medium_overview.dart';
import 'package:store_admin_panel/pages/overview/components/small_overview.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const ResponsiveDirector(
          smallWidget: SmallOverview(),
          mediumWidget: MediumOverview(),
          largeWidget: LargeOverview()),
    );
  }
}
