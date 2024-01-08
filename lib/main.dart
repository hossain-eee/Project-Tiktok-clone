import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/views/screens/auth/login_screeen.dart';
import 'package:tiktok_clone/views/screens/auth/signUp_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
     Get.put(AuthController());
  });
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok clone',
      /*   theme: ThemeData(
        useMaterial3: false,
      ), */
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      // home: LoginScreen(),
      home: SignUpScreen(),
    );
  }
}
