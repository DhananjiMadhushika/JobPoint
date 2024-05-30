import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/features/authentication/controller/login_controller.dart';
import 'package:jobpoint/src/features/authentication/screens/signup/user_register.dart';

import '../employee/employeeHome.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the previous page when the arrow icon is clicked
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.arrow_back_outlined),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Job',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Point',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Let's Login, Apply to jobs",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFAFB0B6),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 30),
                  child: Container(
                    height: 60,
                    width: 330,
                    child: TextField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 106, 107, 110),
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 106, 107, 110),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 106, 107, 110),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 106, 107, 110),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                  child: Container(
                    height: 60,
                    width: 330,
                    child: TextField(
                      controller: controller.password,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 106, 107, 110),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 106, 107, 110),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 106, 107, 110),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 106, 107, 110),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color.fromARGB(255, 106, 107, 110),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Register user using Firebase Authentication
                      controller.login(
                        controller.email.text.trim(),
                        controller.password.text.trim(),
                      );


                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF2882B5),
                      minimumSize: const Size(330, 60),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 115, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      // Call the Google Sign-In method
                      controller.googleSignIn();
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 38,
                          width: 38,
                          child: Image.asset(
                            "assets/login/googles.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sign in with Google",
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 25, top: 30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserRegister(),
                        ),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: "Haven't an account?",
                          style: TextStyle(color: Colors.black87),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
