import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/pages/overview/components/large_overview/large_overview.dart';
import 'package:store_admin_panel/pages/overview/components/medium_overview/medium_overview.dart';
import 'package:store_admin_panel/pages/overview/components/small_overview/small_overview.dart';
import 'package:store_admin_panel/responsiveness/responsiveness.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveDirector(
          smallWidget: SmallOverview(),
          mediumWidget: MediumOverview(),
          largeWidget: LargeOverview());
  }
}
