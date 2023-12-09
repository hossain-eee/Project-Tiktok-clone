import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/models/user.dart' as model;
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage; // make observeable
//picked image
  File? get profilePhot => _pickedImage.value; // get value of _pickedImage
  void pickedImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
    //put image path
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

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
      String userName, String email, String password/* , File? image */) async {
    //make sure every parameter has data
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty /* &&
          image != null */) {
        //save out user to our auth and firebase
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        // String downloadUrl = await _uploadToStorage(image);
        //add model class
        model.User user = model.User(
            name: userName,
            // profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);
        //add data to firestore database
        await fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.tojson());
      } else {
        Get.snackbar("Error Creating Account", 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
  }
}
