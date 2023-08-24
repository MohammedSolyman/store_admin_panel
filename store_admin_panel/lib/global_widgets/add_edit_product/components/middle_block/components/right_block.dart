import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_button/my_button.dart';

class RightBlock extends StatelessWidget {
  const RightBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
              icon: Icons.delete,
              txt: 'clear image',
              func: myController.clearImage),
          const SizedBox(
            height: 15,
          ),
          MyButton(
              icon: Icons.upload,
              txt: 'choose image',
              func: myController.chooseImage)
        ],
      ),
    );
  }
}
