import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/sign_in_page_controller.dart';
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

  _sendVerificationEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    user!.sendEmailVerification();
  }

  signUpEmail({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
  }) async {
    //show loading progress indicator while signing up
    //showWaiting();
    UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (FirebaseAuth.instance.currentUser != null) {
        //if successful signing up, assgin the user name to this user
        //and go to sign in page

        await credential.user!.updateDisplayName(userName);
        _sendVerificationEmail();

        // send this user id to firestore admin collection
        await FirebaseFirestore.instance
            .collection('admin')
            .add({'id': credential.user!.uid});

        // go to sign in page
        GoRouter.of(context).go(PagesPaths.signInPage);
      }
    } on FirebaseAuthException catch (e) {
      //in case of weak password, show a warning dialoge
      if (e.code == 'weak-password') {
        // GoRouter.of(context).pop();
        // showMyDialoge(
        //     context: context,
        //     col: Colors.orange,
        //     title: 'weak password',
        //     content: 'The password provided is too weak, try stronger pasword');
      } else if (e.code == 'email-already-in-use') {
        //in case of already exist user email, show a warning dialoge
        //  GoRouter.of(context).pop();

        // showMyDialoge(
        //     context: context,
        //     col: Colors.orange,
        //     title: 'already exists',
        //     content: 'The account already exists for that email.');
      }
    } catch (e) {
      //in case of an other error, show a warning dialoge
      //  GoRouter.of(context).pop();
      // showMyDialoge(
      //     context: context,
      //     col: Colors.orange,
      //     title: 'Error',
      //     content: e.toString());
    }
  }

  signUpFunc(BuildContext context) {
    String userName = signUpPageModel.value.tecUserName.text;
    String email = signUpPageModel.value.tecEmail.text;
    String password = signUpPageModel.value.tecPassword.text;

    signUpEmail(
        context: context, userName: userName, email: email, password: password);
    _clearTec();
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    toSignIn(context);
  }
}
