import 'package:flutter/material.dart';
import 'package:jobpoint/screens/Company/company_login.dart';

class CompanyRegistration extends StatefulWidget {
  const CompanyRegistration({Key? key}) : super(key: key);

  @override
  State<CompanyRegistration> createState() => _CompanyRegistrationState();
}

class _CompanyRegistrationState extends State<CompanyRegistration> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true; // Added for Confirm Password

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Registration",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Let's Register, Post to jobs",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFAFB0B6),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: Container(
                      height: 60,
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.people,
                              color: Color.fromARGB(255, 106, 107, 110)),
                          labelText: 'Company Name',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 106, 107, 110)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 106, 107, 110),
                                width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 106, 107, 110),
                                width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: Container(
                    height: 60,
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 106, 107, 110),
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 106, 107, 110)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 106, 107, 110),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 106, 107, 110),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: Container(
                    height: 60,
                    width: 350,
                    child: TextField(
                      obscureText:
                          _obscurePassword, // This hides the password by default
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
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: Container(
                    height: 60,
                    width: 350,
                    child: TextField(
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_clock_rounded,
                          color: Color.fromARGB(255, 106, 107, 110),
                        ),
                        labelText: 'Confirm Password',
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
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                          icon: Icon(
                            _obscureConfirmPassword
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
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF2882B5),
                      ),
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ),
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
                        child: Image.asset("assets/images/googles.png",
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
                  padding: const EdgeInsets.only(bottom: 20, left: 30, top: 20),
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompanyLogin()));
                      },
                      child: RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: 'Have an account?',
                            style: TextStyle(color: Color(0xFFAFB0B6))),
                        TextSpan(
                            text: 'Login', style: TextStyle(color: Colors.blue))
                      ])),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
