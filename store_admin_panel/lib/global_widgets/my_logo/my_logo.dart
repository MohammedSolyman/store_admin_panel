import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Image.asset('store.png'),
    );
  }
}
