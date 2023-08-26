import 'package:flutter/material.dart';

Future<void> showWaiting({required BuildContext context}) async {
  AlertDialog x = AlertDialog(
    content: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(child: CircularProgressIndicator())),
    backgroundColor: Colors.grey.withOpacity(0.5),
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return x;
      });
}
