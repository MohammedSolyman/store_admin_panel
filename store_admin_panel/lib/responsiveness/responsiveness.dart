// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';

class BreakPoints {
  static const double smallBreakPoint = 550;
  static const double mediumBreakPoint = 950;
}

class ResponsiveDirector extends StatelessWidget {
  const ResponsiveDirector({
    required this.smallWidget,
    required this.mediumWidget,
    required this.largeWidget,
    super.key,
  });

  final Widget largeWidget;
  final Widget mediumWidget;
  final Widget smallWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(builder: (context, boxConstraints) {
        // double height = boxConstraints.maxHeight;
        double width = boxConstraints.maxWidth;

        if (width >= BreakPoints.mediumBreakPoint) {
          return largeWidget;
        } else if (width < BreakPoints.smallBreakPoint) {
          return smallWidget;
        } else {
          return mediumWidget;
        }
      }),
    );
  }
}
