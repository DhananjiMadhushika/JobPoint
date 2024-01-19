import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobapp/src/features/authentication/models/employeeModel.dart';
import 'package:jobapp/src/repository/authentication_repository/authentication_repositort.dart';
import 'package:jobapp/src/repository/employee_repository/employee_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final telNo = TextEditingController();
  final profession = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());
  final _employeeRepo = Get.put(EmployeeRepository());

  Future<String?> uploadImage(String path, XFile image) async {
    try {
      final folderName = "employeeimages"; // specify your folder name
      final ref =
          FirebaseStorage.instance.ref("$folderName/$path").child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;

    if (email != null) {
      return _employeeRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  updateEmployee(EmployeeModel empployee) async {
    await _employeeRepo.updateEmployee(empployee);
  }
}
