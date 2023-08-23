import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_admin_panel/constants/constants.dart';
import 'package:store_admin_panel/controllers/edit_product_controller.dart';
import 'package:store_admin_panel/models/sign_in_page_model.dart';

class SignInPageController extends EditProductController {
  Rx<SignInPageModel> signInPageModel = SignInPageModel().obs;

  void _clearTec() {
    signInPageModel.update((val) {
      val!.tecEmail.text = '';
      val.tecPassword.text = '';
    });
  }

  signInEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // showWaiting();

    final UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //check if this user is an admin
      String thisUserId = FirebaseAuth.instance.currentUser!.uid;

      QuerySnapshot<Map<String, dynamic>> qSS =
          await FirebaseFirestore.instance.collection('admin').get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = qSS.docs;
      List<String> idList = [];
      for (var element in myList) {
        idList.add(element.data()['id']);
      }

      //   myList.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      //   idList.add(element.data()['id']);
      // });

      if (idList.contains(thisUserId)) {
        //proceed:

        if (credential.user!.emailVerified) {
          //  Get.back();

          GoRouter.of(context).replace(PagesPaths.overview);
        } else {
          // Get.back();

          // showMyDialoge(
          //     context: context,
          //     col: Colors.orange,
          //     title: 'Unverified user',
          //     content: 'please go to your eamil to activate your account.');
        }
        // sign out if this user is not an admin
      } else {
        await FirebaseAuth.instance.signOut();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Get.back();

        // showMyDialoge(
        //     context: context,
        //     col: Colors.orange,
        //     title: 'user-not-found',
        //     content: 'enter the correct user');
      } else if (e.code == 'wrong-password') {
        // Get.back();
        // showMyDialoge(
        //     context: context,
        //     col: Colors.orange,
        //     title: 'Wrong password',
        //     content: 'enter the correct pasword');
      }
    }

    // updateCurrentUser();
  }

  signInFunc(BuildContext context) {
    String email = signInPageModel.value.tecEmail.text;
    String password = signInPageModel.value.tecPassword.text;
    signInEmail(context: context, email: email, password: password);
    _clearTec();
  }

  Future<UserCredential> _signInGoogle() async {
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

    //updateCurrentUser();

    return userCredential;
  }

  signInGoogleFunc(BuildContext context) async {
    await _signInGoogle();
    GoRouter.of(context).replace(PagesPaths.overview);
  }
}
