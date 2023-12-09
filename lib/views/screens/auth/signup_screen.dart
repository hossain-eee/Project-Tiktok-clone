import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tiktok Clone",
                  style: TextStyle(
                      fontSize: 35,
                      color: buttonColor,
                      fontWeight: FontWeight.w900),
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                      backgroundColor: Colors.black,
                    ),
                    Positioned(
                      left: 80,
                      bottom: -10,
                      child: IconButton(
                        onPressed: () {
                          authController.pickedImage();
                          print('add photo');
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                //eamil
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: _userNameController,
                      labelText: 'UserName',
                      icon: Icons.person),
                ),
                const SizedBox(
                  height: 15,
                ),
                //eamil
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: Icons.email),
                ),
                const SizedBox(
                  height: 15,
                ),
                //passowrd
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _passwordController,
                    labelText: 'Password',
                    icon: Icons.lock,
                    isObsecure: true,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                //custom button
                Container(
                  width: MediaQuery.sizeOf(context).width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: InkWell(
                      onTap: () {
                        authController.registerUser(
                            _userNameController.text,
                            _emailController.text,
                            _passwordController.text,
                            // authController.profilePhot
                            );
                        print("Register");
                      },
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("Navigating User");
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: buttonColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
