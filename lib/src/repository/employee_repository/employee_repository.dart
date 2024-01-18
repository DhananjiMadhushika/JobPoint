import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobapp/src/features/authentication/models/employeeModel.dart';

class EmployeeRepository extends GetxController {
  static EmployeeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createEmployee(EmployeeModel employee) async {
    try {
      await _db
          .collection("/employee")
          .add(employee.toJSON())
          .whenComplete(() => Get.snackbar(
                "Success",
                "Your account has been created",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green,
              ));
    } catch (error) {
      print('Error creating employee: $error');
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }
}

// Upload Images

Future<String?> uploadImage(String path, XFile image) async {
  try {
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e) {
    print(e);
  }
}
