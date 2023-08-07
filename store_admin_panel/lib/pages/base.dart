import 'package:flutter/material.dart';
import 'package:store_admin_panel/pages/overview/components/large_overview/large_overview.dart';
import 'package:store_admin_panel/pages/overview/components/medium_overview/medium_overview.dart';
import 'package:store_admin_panel/pages/overview/components/small_overview/small_overview.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDirector(
          smallWidget: SmallOverview(),
          mediumWidget: MediumOverview(),
          largeWidget: LargeOverview());
  }
}
