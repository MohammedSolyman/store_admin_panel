import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/texts/my_title.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myController.signInGoogleFunc(context);
      },
      child: Row(
        children: [
          SizedBox(
            height: 30,
            child: Image.asset('icons/google.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          const MyTitle('sign in with google')
        ],
      ),
    );
  }
}
