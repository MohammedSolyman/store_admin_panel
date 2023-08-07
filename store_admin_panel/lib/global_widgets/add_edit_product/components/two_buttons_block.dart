import 'package:flutter/material.dart';
import 'package:store_admin_panel/global_widgets/my_button/my_button.dart';


class TwoButttonsBlock extends StatelessWidget {
  const TwoButttonsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyButton(Icons.delete, 'delete'),
        MyButton(Icons.upload, 'upload'),
      ],
    ));
  }
}