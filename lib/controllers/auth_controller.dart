import 'dart:io';

import 'package:get/get.dart';

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
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }
}
