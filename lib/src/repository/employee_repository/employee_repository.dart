import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  // fetch  all user or user details

  Future<EmployeeModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("employee").where("email", isEqualTo: email).get();
    final userData =
        snapshot.docs.map((e) => EmployeeModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<EmployeeModel>> allUser(String email) async {
    final snapshot = await _db.collection("employee").get();
    final userData =
        snapshot.docs.map((e) => EmployeeModel.fromSnapshot(e)).toList();
    return userData;
  }

  // Update employee

  Future<void> updateEmployee(EmployeeModel employee) async {
    await _db.collection("employee").doc(employee.id).update(employee.toJSON());
  }
}
