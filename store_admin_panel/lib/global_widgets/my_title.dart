
import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle(
    this.txt, {
    super.key,
  });

  final String txt;
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: Theme.of(context).textTheme.headlineLarge);
  }
}