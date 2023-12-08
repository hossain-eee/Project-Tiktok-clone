import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/views/screens/auth/login_screeen.dart';
import 'package:tiktok_clone/views/screens/auth/signUp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
