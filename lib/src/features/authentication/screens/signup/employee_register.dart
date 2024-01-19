import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobapp/src/features/authentication/controller/signup_controller.dart';
import 'package:jobapp/src/features/authentication/models/employeeModel.dart';
import 'package:jobapp/src/features/authentication/screens/login/employee_login.dart';

class EmployeeRegister extends StatefulWidget {
  const EmployeeRegister({super.key});

  @override
  State<EmployeeRegister> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EmployeeRegister> {
  bool _isObscure = true; // Flag to toggle password visibility
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 50,
                        width: 250,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the previous page when the arrow icon is clicked
                            Navigator.of(context).pop();
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_back_outlined),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    height: 70,
                    width: 350,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          "Registration",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("Let's Register.Apply to jobs")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        const Opacity(
                          opacity:
                              0.8, // Adjust the opacity value as needed (0.0 - 1.0)
                          child: Icon(Icons.people),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: controller.fullname,
                            decoration: const InputDecoration(
                              hintText: 'Enter your full name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        const Opacity(
                          opacity:
                              0.8, // Adjust the opacity value as needed (0.0 - 1.0)
                          child: Icon(Icons.email),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: controller.email,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          const Opacity(
                            opacity:
                                0.8, // Adjust the opacity value as needed (0.0 - 1.0)
                            child: Icon(Icons.key_rounded),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: controller.password,
                              obscureText: _isObscure,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          const Opacity(
                            opacity:
                                0.8, // Adjust the opacity value as needed (0.0 - 1.0)
                            child: Icon(Icons.phone),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: controller.telNo,
                              obscureText: _isObscure,
                              decoration: const InputDecoration(
                                hintText: 'Telphone No',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2.0),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 8),
                        const Opacity(
                          opacity:
                              0.8, // Adjust the opacity value as needed (0.0 - 1.0)
                          child: Icon(Icons.email),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: controller.profession,
                            decoration: InputDecoration(
                              hintText: 'Proffession',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Register user using Firebase Authentication
                        SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim(),
                        );

                        // If user registration is successful, create employee in Firestore
                        final employee = EmployeeModel(
                          fullName: controller.fullname.text.trim(),
                          email: controller.email.text.trim(),
                          telNo: controller.telNo.text.trim(),
                          profession: controller.profession.text.trim(),
                        );

                        SignUpController.instance.createEmployee(employee);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF2882B5),
                      minimumSize: const Size(320, 60),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: const Text(
                        "or",
                        style:
                            TextStyle(color: Color(0xFFAFB0B6), fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 115, top: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: Image.asset("assets/login/googles.png",
                            fit: BoxFit.cover),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Signup with google",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 25, top: 30),
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserLogin()));
                        },
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'Have an account?',
                              style: TextStyle(color: Colors.black87)),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(color: Colors.blue))
                        ])),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
