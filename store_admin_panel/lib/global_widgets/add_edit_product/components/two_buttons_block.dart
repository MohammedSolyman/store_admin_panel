import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_button/my_button.dart';

class TwoButttonsBlock extends StatelessWidget {
  const TwoButttonsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyButton(
            icon: Icons.delete, txt: 'delete', func: myController.addProduct),
        MyButton(
            icon: Icons.upload,
            txt: 'upload',
            contextFunc: myController.uploadFunc),
      ],
    ));
  }
}
