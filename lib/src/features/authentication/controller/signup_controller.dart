import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:jobpoint/src/features/authentication/models/companyModel.dart';
import 'package:jobpoint/src/features/authentication/models/employeeModel.dart';
import 'package:jobpoint/src/repository/authentication_repository/authentication_repositort.dart';
import 'package:jobpoint/src/repository/employee_repository/companyRepository.dart';
import 'package:jobpoint/src/repository/employee_repository/employee_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

// Text field controller to get data from the Textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final telNo = TextEditingController();
  final profession = TextEditingController();
  final about = TextEditingController();

  final RxList<AppliedJob> appliedJobs = <AppliedJob>[].obs;



  final employeeRepo = Get.put(EmployeeRepository());
  final companyRepo = Get.put(CompanyRepository());

// call this function from design & it will go to the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createEmployee(EmployeeModel employee) async {
    await employeeRepo.createEmployee(employee);
  }

  Future<void> createCompany(CompanyModel company) async {
    await companyRepo.createCompany(company);
  }
}
