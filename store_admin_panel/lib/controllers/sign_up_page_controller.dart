import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/sign_in_page_controller.dart';
import 'package:store_admin_panel/global_widgets/dialoges/show_my_dialoge.dart';
import 'package:store_admin_panel/global_widgets/dialoges/show_waiting.dart';
import 'package:store_admin_panel/models/sign_up_page_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPageController extends SignInPageController {
  Rx<SignUpPageModel> signUpPageModel = SignUpPageModel().obs;

  void _clearTec() {
    signUpPageModel.update((val) {
      val!.tecEmail.text = '';
      val.tecPassword.text = '';
      val.tecUserName.text = '';
    });
  }

  Future<void> _sendVerificationEmail() async {
    //send a verification email to this user's email
    User? user = FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification();
  }

  Future<void> _signUpEmail({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
  }) async {
    //1. show loading progress indicator while signing up
    await showWaiting(context: context);

    //2. trying signing up
    UserCredential credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (FirebaseAuth.instance.currentUser != null) {
        //3 in case of successful signing up.

        //3.1 assgin the user name to this user.
        await credential.user!.updateDisplayName(userName);

        //3.2 send a verification email.
        _sendVerificationEmail();

        //3.3 send this user id to firestore admin collection.
        await FirebaseFirestore.instance
            .collection('admin')
            .add({'id': credential.user!.uid});

//3.4 stop the waiting dialog.
        toBack(context);

        //3.5 go to sign in page.
        GoRouter.of(context).go(PagesPaths.signInPage);
      }
    } on FirebaseAuthException catch (e) {
      //4. in case of unsuccessfuli signing up.

      if (e.code == 'weak-password') {
        //4.1 in case of weak password

        //4.1 stop the waiting dialog.
        toBack(context);

        //4.2 show a warning dialoge.
        await showMyDialoge(
            context: context,
            col: Colors.red.withOpacity(0.75),
            title: 'sorry',
            content: 'The password provided is too weak, try stronger pasword');
      } else if (e.code == 'email-already-in-use') {
        //5. in case of already exist user email

        //5.1 stop the waiting dialog.
        toBack(context);

        //5.2 show a warning dialoge
        await showMyDialoge(
            context: context,
            col: Colors.red.withOpacity(0.75),
            title: 'sorry',
            content: 'The account already exists for that email.');
      }
    } catch (e) {
      //6. in case of an other error,

      //6.1 stop the waiting dialog.
      toBack(context);

      //6.2 show a warning dialoge
      await showMyDialoge(
          context: context,
          col: Colors.red.withOpacity(0.75),
          title: 'error',
          content: e.toString());
    }
  }

  Future<void> signUpFunc(BuildContext context) async {
    //1. collect user data.
    String userName = signUpPageModel.value.tecUserName.text;
    String email = signUpPageModel.value.tecEmail.text;
    String password = signUpPageModel.value.tecPassword.text;

    //2. sign up
    await _signUpEmail(
        context: context, userName: userName, email: email, password: password);

    //3. clear text fiels
    _clearTec();
  }

  Future<void> signOut(BuildContext context) async {
    //1. show waiting dialog.
    await showWaiting(context: context);

    //2. sign out
    await FirebaseAuth.instance.signOut();

    //3. clear from get storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);

    //4. navogate to sgin in page
    toSignIn(context);
  }
}
