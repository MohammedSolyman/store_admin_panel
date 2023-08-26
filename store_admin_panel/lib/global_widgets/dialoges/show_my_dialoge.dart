import 'package:flutter/material.dart';

Future<void> showMyDialoge(
    {required BuildContext context,
    required Color col,
    required String title,
    required content}) async {
  AlertDialog x = AlertDialog(
    title: Text(title),
    content: Text(content),
    backgroundColor: col,
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return x;
      });
}
