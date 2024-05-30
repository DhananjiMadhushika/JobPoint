import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/features/authentication/screens/employee/userProfile.dart';
import 'package:jobpoint/src/features/authentication/screens/login/user_login.dart';
import 'package:jobpoint/src/repository/authentication_repository/authentication_repositort.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Obx(() {
        // Use the value of isLoggedIn to determine which screen to show
        return Get.find<AuthenticationRepository>().isLoggedIn.value
            ? UserProfile()
            : UserLogin();
      }),
    );
  }
}
