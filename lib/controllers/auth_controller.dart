import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';

class AuthCotroller extends GetxController {
  //method for upload the firebase storage(image upload)
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

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
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }
}
