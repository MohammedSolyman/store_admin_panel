import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_form/my_form.dart';
import 'package:store_admin_panel/global_widgets/my_logo/my_logo.dart';
import 'package:store_admin_panel/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_admin_panel/pages/sign_in_page/components/google_sign_in.dart';
import 'package:store_admin_panel/pages/sign_in_page/components/my_line.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MySizedBox(),
                const MyLogo(),
                const MySizedBox(),
                const MySizedBox(),
                MyForm(
                    label: 'email',
                    controller: myController.signInPageModel.value.tecEmail),
                const MySizedBox(),
                MyForm(
                    isObsecure: true,
                    label: 'password',
                    controller: myController.signInPageModel.value.tecPassword),
                const MySizedBox(),
                const MyLine(),
                const MySizedBox(),
                ElevatedButton(
                    onPressed: () {
                      myController.signInFunc(context);
                    },
                    child: const Text('sign in as an admin')),
                const MySizedBox(),
                const MySizedBox(),
                const GoogleSignIn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
