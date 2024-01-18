import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobapp/src/features/authentication/models/companyModel.dart';

class CompanyRepository extends GetxController {
  static CompanyRepository get instance => Get.find();

  final _db2 = FirebaseFirestore.instance;

  createCompany(CompanyModel company) async {
    try {
      await _db2
          .collection("company")
          .add(company.toJSON())
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
