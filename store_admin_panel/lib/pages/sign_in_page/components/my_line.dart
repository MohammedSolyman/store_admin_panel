import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_text.dart';

class MyLine extends StatelessWidget {
  const MyLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MyText("if you dont't have an accout, click "),
        //  const Text("if you dont't have an accout, click "),
        InkWell(
            onTap: () {
              myController.toSignUp(context);
            },
            child: const Text(
              'here',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ))
      ],
    );
  }
}
