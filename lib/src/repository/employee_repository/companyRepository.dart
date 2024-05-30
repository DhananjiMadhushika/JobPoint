import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/features/authentication/models/companyModel.dart';

import '../../features/authentication/controller/login_controller.dart';

class CompanyRepository extends GetxController {
  static CompanyRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createCompany(CompanyModel company) async {
    try {
      await _db
          .collection("/company")
          .add(company.toJSON())
          .then((value) => Get.snackbar(
        "Success",
        "Your company details have been saved",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      ));
    } catch (error) {
      print('Error creating company: $error');
      Get.snackbar(
        "Error",
        "Something went wrong while saving company details",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }
// Fetch All company or company details
  Future<List<CompanyModel>> getAllCompaniesForLoggedInUser() async {
    try {
      final String loggedInUserEmail = LoginController.instance.email.text.trim();

      final snapshot = await _db
          .collection("company")
          .where("jobPosterEmail", isEqualTo: loggedInUserEmail)
          .get();

      final List<CompanyModel> companyData =
      snapshot.docs.map((e) => CompanyModel.fromSnapshot(e)).toList();

      return companyData;
    } catch (error) {
      print('Error fetching companies for logged-in user: $error');
      // Handle error gracefully, maybe show a snackbar or return an empty list
      return [];
    }
  }

  // All company
  Future<List<CompanyModel>> allCompany() async {
    final snapshot = await _db
        .collection("company")
        .get();
    final companyData =
        snapshot.docs.map((e) => CompanyModel.fromSnapshot(e)).toList();
    return companyData;
  }
}
