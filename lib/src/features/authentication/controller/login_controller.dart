import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobapp/src/repository/authentication_repository/authentication_repositort.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  //final isGoogleLoading = false.obs;

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  void login(String email, String password) {
    AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }

  // Google sign in authentication

  // Future<void> googleSignIn() async {
  //   try {
  //     isGoogleLoading.value = true;
  //     await AuthenticationRepository.instance.signInWithGoogle();
  //     isGoogleLoading.value = false;
  //   } catch (e) {
  //     isGoogleLoading.value = false;
  //     print(e);
  //   }
  // }
}
