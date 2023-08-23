import 'package:flutter/material.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/global_widgets/my_form/my_form.dart';
import 'package:store_admin_panel/global_widgets/my_logo/my_logo.dart';
import 'package:store_admin_panel/global_widgets/my_sized_box/my_sized_box.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MySizedBox(),
                  const MyLogo(),
                  const MySizedBox(),
                  const MySizedBox(),
                  MyForm(
                      label: 'username',
                      controller:
                          myController.signUpPageModel.value.tecUserName),
                  const MySizedBox(),
                  MyForm(
                      label: 'email',
                      controller: myController.signUpPageModel.value.tecEmail),
                  const MySizedBox(),
                  MyForm(
                      isObsecure: true,
                      label: 'password',
                      controller:
                          myController.signUpPageModel.value.tecPassword),
                  const MySizedBox(),
                  // MySizedBox(),
                  ElevatedButton(
                      onPressed: () {
                        myController.signUpFunc(context);
                      },
                      child: const Text('sign up as an admin')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
