import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_button/my_button.dart';

class LowerBlock extends StatelessWidget {
  const LowerBlock({
    required this.isEdit,
    super.key,
  });

  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: isEdit,
            child: MyButtonAsync(
              icon: Icons.delete,
              txt: 'delete product',
              contextFunc: myController.editDeleteFunc,
            )),
        const SizedBox(
          width: 20,
        ),
        MyButtonAsync(
          icon: Icons.upload,
          txt: isEdit ? 'edit product' : 'add product',
          contextFunc:
              isEdit ? myController.askToEdit : myController.addUploadFunc,
        ),
      ],
    ));
  }
}
