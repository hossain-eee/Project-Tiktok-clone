import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/models/user.dart' as model;
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  bool _isLoading = false;
  RxBool _isSigninLoading = false.obs;
  late Rx<File?>
      _pickedImage; // make observeable, RX file is automatic observeable no need to update() method, update() is used to only GetBuilder()
  bool get isLoading => _isLoading;
  RxBool get isSigninLoading => _isSigninLoading;
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

    // Upload the image file to Firebase Storage.
    UploadTask uploadTask = ref.putFile(image);
    // Wait for the upload to complete and get the task snapshot.
    TaskSnapshot snap = await uploadTask;
    // Get the download URL of the uploaded image.
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  //registering the user
  Future<bool> registerUser(
      String userName, String email, String password, File? image) async {
    _isLoading = true;
    update();
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
        //add model class
        model.User user = model.User(
            name: userName,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);
        //add data to firestore database
        await fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.tojson())
            .then((value) {
          _isLoading = false;
          update();
          Get.snackbar("Success", 'Success');
        });
      } else {
        Get.snackbar("Error Creating Account", 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error Creating Account', e.toString());
    }
    _isLoading = false;
    update();
    return true; // this return type is only for make it async await capable, because void don't take await
  }

  void userLogin(String email, String password) async {
    _isSigninLoading.value = true;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Success', 'Login successful');
          print("Login Success");
          _isSigninLoading.value = false;
        }).catchError((error) {
          Get.snackbar('Error to Login', 'Invalid email or password');
          print('Firebase Authentication Error: $error');
        });
      } else {
        Get.snackbar('Incomplete Field', 'Please insert email and password');
      }
    } catch (e) {
      Get.snackbar('Unexpected Error', 'An unexpected error occurred');
      print('Unexpected Error: $e');
    }
    _isSigninLoading.value = false;
  }
}
