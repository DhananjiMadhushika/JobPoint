import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/companyModel.dart';
import '../models/employeeModel.dart';


class ApplicationController extends GetxController {
  static ApplicationController get instance => Get.find();

  final applicantName = TextEditingController();
  final applicantEmail = TextEditingController();
  final applyPosition = TextEditingController();
  final resumeUrl = ''.obs;
  File? resumeFile;

  @override
  void onClose() {
    applicantName.dispose();
    applicantEmail.dispose();
    applyPosition.dispose();
    super.onClose();
  }

  Future<void> uploadResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null && result.files.isNotEmpty) {
      resumeFile = File(result.files.single.path!);
      print('Picked file: ${resumeFile!.path}');
      resumeUrl.value = resumeFile!.path;
    } else {
      print('No file selected');
    }
  }

  Future<String> uploadFileToStorage(File file) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      TaskSnapshot snapshot = await storage
          .ref('resumes/${file.path.split('/').last}')
          .putFile(file);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw 'Error uploading file: $e'; // Throw the error here
    }
  }


  Future<void> applyForJob(String companyId, String employeeId) async {
    try {
      if (resumeUrl.isEmpty) {
        throw 'Please upload a resume before applying';
      }

      // Retrieve the company document
      DocumentSnapshot<Map<String, dynamic>> companySnapshot =
      await FirebaseFirestore.instance.collection('company').doc(companyId).get();

      if (!companySnapshot.exists) {
        throw 'Company not found';
      }

      CompanyModel company = CompanyModel.fromSnapshot(companySnapshot);

      Application application = Application(
        applicantName: applicantName.text,
        position: applyPosition.text,
        resumeUrl: resumeUrl.value,
      );

      // Update the company's application list
      company.applications.add(application);

      // Update the company document in Firestore
      await FirebaseFirestore.instance.collection('company').doc(companyId).update(company.toJSON());

      // Retrieve the employee document
      DocumentSnapshot<Map<String, dynamic>> employeeSnapshot =
      await FirebaseFirestore.instance.collection('employee').doc(employeeId).get();

      if (!employeeSnapshot.exists) {
        throw 'Employee not found';
      }

      EmployeeModel employee = EmployeeModel.fromSnapshot(employeeSnapshot);

      // Create the applied job entry
      AppliedJob appliedJob = AppliedJob(
        companyName: company.companyName!,
        position: company.position,
        imageUrl: company.imageUrl,
        status: 'Applied',
      );

      // Update the employee's applied jobs list
      employee.appliedJobs.add(appliedJob);

      // Update the employee document in Firestore
      await FirebaseFirestore.instance.collection('employee').doc(employeeId).update(employee.toJSON());

      // Show success message
      Get.snackbar('Success', 'Job application submitted successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      // Clear form fields
      applicantName.clear();
      applicantEmail.clear();
      applyPosition.clear();
      resumeUrl.value = '';
    } catch (e) {
      // Show error message
      Get.snackbar('Error', 'Failed to submit job application: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }


  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<String?> getLogedEmployeeId(String email) async {
    final snapshot =
    await _db.collection("employee").where("email", isEqualTo: email).get();
    final userData =
        snapshot.docs.map((e) => EmployeeModel.fromSnapshot(e)).single;
    return userData.id;
  }


}
