import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobpoint/src/features/authentication/models/employeeModel.dart';
import 'package:jobpoint/src/repository/employee_repository/employee_repository.dart';

import '../../../repository/authentication_repository/authentication_repositort.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final telNo = TextEditingController();
  final profession = TextEditingController();

  final _authRepo = Get.put(AuthenticationRepository());
  final _employeeRepo = Get.put(EmployeeRepository());

  var employee = EmployeeModel(
    fullName: '',
    email: '',
    telNo: '',
    profession: '',
    appliedJobs: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final downloadUrl = await uploadImageToFirebase(pickedImage);

      if (downloadUrl != null) {
        final updatedEmployee = employee.value.copyWith(profilePic: downloadUrl);
        await _employeeRepo.updateEmployee(updatedEmployee);
        employee.value = updatedEmployee; // Update the employee observable
      } else {
        Get.snackbar("Error", "Failed to upload image.");
      }
    }
  }

  Future<String?> uploadImageToFirebase(XFile image) async {
    try {
      final Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('employee_images/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = firebaseStorageRef.putFile(File(image.path));
      final TaskSnapshot storageSnapshot = await uploadTask;
      final String downloadUrl = await storageSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void getUserData() async {
    final userEmail = _authRepo.firebaseUser.value?.email;

    if (userEmail != null) {
      EmployeeModel userData = await _employeeRepo.getUserDetails(userEmail);
      employee.value = userData;
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
  }

  void updateEmployee(EmployeeModel updatedEmployee) async {
    await _employeeRepo.updateEmployee(updatedEmployee);
    employee.value = updatedEmployee;
  }
}
