import 'dart:html';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';

class AuthCotroller extends GetxController {
  //registering the user
  void registerUser(
      String userName, String email, String password, File? image) async {
    //make sure every parameter has data
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save out user to our auth and firebase
      UserCredential cred =  await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }
}
