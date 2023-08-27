import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/edit_product_controller.dart';
import 'package:store_admin_panel/global_widgets/dialoges/show_my_dialoge.dart';
import 'package:store_admin_panel/global_widgets/dialoges/show_waiting.dart';
import 'package:store_admin_panel/models/sign_in_page_model.dart';

class SignInPageController extends EditProductPageController {
  Rx<SignInPageModel> signInPageModel = SignInPageModel().obs;

  void _clearTec() {
    // clear text fields
    signInPageModel.update((val) {
      val!.tecEmail.text = '';
      val.tecPassword.text = '';
    });
  }

  Future<void> signInEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // 1. showWaiting();
    await showWaiting(context: context);

    //2. trying signing in
    final UserCredential credential;
    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //3 in case of successful signing in.

      //3.1 check if this user is an admin
      String thisUserId = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot<Map<String, dynamic>> qSS =
          await FirebaseFirestore.instance.collection('admin').get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = qSS.docs;
      List<String> idList = [];
      for (var element in myList) {
        idList.add(element.data()['id']);
      }

      if (idList.contains(thisUserId)) {
        //3.2 in case of admin account
        //3.3 check if this user verified his email.
        if (credential.user!.emailVerified) {
          //3.4 in case of verified his email
          //3.5 stop the waiting dialog.
          toBack(context);

          //3.6 navigate to overview page
          GoRouter.of(context).replace(PagesPaths.overview);
        } else {
          //3.3 in case of unverified email
          //3.4 stop the waiting dialog
          toBack(context);

          //3.5 show a warning dialog.
          await showMyDialoge(
              context: context,
              col: Colors.red.withOpacity(0.75),
              title: 'sorry',
              content: 'please go to your eamil to activate your account.');
        }
      } else {
        //if the user is not admin sign out if this user as he is not an admin
        await FirebaseAuth.instance.signOut();
      }
    } on FirebaseAuthException catch (e) {
      //in case of unsuccessful singing in
      if (e.code == 'user-not-found') {
        //1. if the user is not found
        //1.1 stop the waiting dialog
        toBack(context);

//1.2 show a warning dialog.
        await showMyDialoge(
            context: context,
            col: Colors.red.withOpacity(0.75),
            title: 'sorry',
            content: 'enter the correct user.');
      } else if (e.code == 'wrong-password') {
        //2. in case of wrong password
        //2.1 stop the waiting dialog
        toBack(context);

        //2.2 show a warning dialog.
        await showMyDialoge(
            context: context,
            col: Colors.red.withOpacity(0.75),
            title: 'sorry',
            content: 'enter the correct pasword.');
      }
    }
  }

  Future<void> signInFunc(BuildContext context) async {
    //1. collect information from text input forms
    String email = signInPageModel.value.tecEmail.text;
    String password = signInPageModel.value.tecPassword.text;

    //2. sign in
    await signInEmail(context: context, email: email, password: password);

    //3. store in getStore
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    //4. clear all text forms
    _clearTec();
  }

  Future<void> _signInGoogle(BuildContext context) async {
    //1. show waiting dialog
    await showWaiting(context: context);

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // 2. store in getStore
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      //stop waiting dialog.
      toBack(context);

      //navigate to overview page
      toOverview(context);

      //return userCredential;
    } catch (e) {
      //stop waiting dialog.
      toBack(context);

      await showMyDialoge(
          context: context,
          col: Colors.red.withOpacity(0.75),
          title: 'sorry',
          content: e.toString());
    }
  }

  Future<void> signInGoogleFunc(BuildContext context) async {
    //1. sign in
    await _signInGoogle(context);
  }
}
