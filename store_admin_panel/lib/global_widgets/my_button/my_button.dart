import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
    this.icon,
    this.txt, {
    super.key,
  });

  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [Icon(icon), Text(txt)],
        ));
  }
}
