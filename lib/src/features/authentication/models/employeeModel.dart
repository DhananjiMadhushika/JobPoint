import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? telNo;
  final String? profession;
  final String? about;
  final Uint8List? profilePic; // Make sure to use nullable Uint8List

  const EmployeeModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.telNo,
    required this.profession,
    this.about,
    this.profilePic,
  });

  // When storing the data
  Map<String, dynamic> toJSON() {
    return {
      "fullName": fullName,
      "email": email,
      "telNo": telNo,
      "profession": profession,
      "about": about,
      "profilePic": profilePic, // Include the profilePic in the JSON
    };
  }

  // This method converts the JSON object to user data
  factory EmployeeModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    return EmployeeModel(
      id: document.id,
      fullName: data?["fullname"],
      email: data?["email"],
      telNo: data?["telNo"],
      profession: data?["profession"],
      about: data?["about"],
      profilePic: data?["profilePic"], // Get the profilePic from the data
    );
  }
}
