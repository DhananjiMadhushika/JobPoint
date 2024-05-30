import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import Firebase Storage
import 'package:jobpoint/src/repository/authentication_repository/authentication_repositort.dart';
import '../../../repository/employee_repository/companyRepository.dart';
import '../models/companyModel.dart';
import 'login_controller.dart';

class CompanyController extends GetxController {

  static CompanyController get instance => Get.find();


  final companyName = TextEditingController();
  final companyEmail = TextEditingController();
  final position = TextEditingController();
  final companyDescription = TextEditingController();
  final employeeSize = TextEditingController();
  final headOffice = TextEditingController();
  File? image;


  final _companyRepository = CompanyRepository.instance;
  final _loginController = LoginController.instance;


  @override
  void onClose() {
    companyName.dispose();
    companyEmail.dispose();
    position.dispose();
    companyDescription.dispose();
    employeeSize.dispose();
    headOffice.dispose();
    super.onClose();
  }

  Future<void> uploadImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  Future<String?> uploadImageToFirebase(File imageFile) async {
    try {
      final Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('company_images/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      final TaskSnapshot storageSnapshot = await uploadTask;
      final String downloadUrl = await storageSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      print('Error uploading image to Firebase Storage: $error');
      return null;
    }
  }

  void saveCompanyDetails() async {
    try {
      final String loggedInUserEmail = _loginController.email.text.trim();

      if (image != null) {
        final String? imageUrl = await uploadImageToFirebase(image!);

        if (imageUrl != null) {
          final company = CompanyModel(
            companyName: companyName.text.trim(),
            email: companyEmail.text.trim(),
            position: position.text.trim(),
            description: companyDescription.text.trim(),
            employeeSize: employeeSize.text.trim(),
            headOffice: headOffice.text.trim(),
            jobPosterEmail: loggedInUserEmail,
            imageUrl: imageUrl,
          );

          // Save company details to Firestore
          await _companyRepository.createCompany(company);

          // Clear text fields after saving
          companyName.clear();
          companyEmail.clear();
          position.clear();
          companyDescription.clear();
          employeeSize.clear();
          headOffice.clear();

          // Show success message to the user
          Get.snackbar(
            "Success",
            "Company details saved successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          );
        } else {
          Get.snackbar(
            "Error",
            "Failed to upload image",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Please upload an image",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      }
    } catch (error) {
      print('Error saving company details: $error');
      // Show error message to the user
      Get.snackbar(
        "Error",
        "Failed to save company details. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  //
final _authRepo = Get.put(AuthenticationRepository());
final _companyRepo = Get.put(CompanyRepository());
getCompanyData(){
  final email = _authRepo.firebaseUser.value?.email;

  if(email != null){
    return _companyRepo.getAllCompaniesForLoggedInUser();
  }
  else{
    Get.snackbar("Error", "Login to continue");
  }

}

getAllCompanyData(){
  return _companyRepo.allCompany();
}
// Application Handle

  final FirebaseFirestore _db = FirebaseFirestore.instance;





}






