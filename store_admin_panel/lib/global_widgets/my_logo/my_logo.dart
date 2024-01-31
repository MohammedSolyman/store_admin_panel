import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Image.asset(AssetsPaths.logo),
    );
  }
}
