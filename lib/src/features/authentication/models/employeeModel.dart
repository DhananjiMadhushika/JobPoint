import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppliedJob {
  final String companyName;
  final String position;
  final String? imageUrl;
  final String status;

  AppliedJob({
    required this.companyName,
    required this.position,
    this.imageUrl,
    required this.status,
  });

  // Factory constructor to create an AppliedJob object from a Firestore map
  factory AppliedJob.fromMap(Map<String, dynamic> data) {
    return AppliedJob(
      companyName: data['companyName'],
      position: data['position'],
      imageUrl: data['imageUrl'],
      status: data['status'],
    );
  }

  // Convert AppliedJob object to JSON
  Map<String, dynamic> toJSON() {
    return {
      "companyName": companyName,
      "position": position,
      "imageUrl": imageUrl,
      "status": status,
    };
  }
}

class EmployeeModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? telNo;
  final String? profession;
  final String? about;
  final String? profilePic; // Make sure to use nullable Uint8List
  final List<AppliedJob> appliedJobs; // List of applied jobs

  const EmployeeModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.telNo,
    required this.profession,
    this.about,
    this.profilePic,
    this.appliedJobs = const [], // Initialize with an empty list by default
  });

  // When storing the data
  Map<String, dynamic> toJSON() {
    return {
      "fullName": fullName,
      "email": email,
      "telNo": telNo,
      "profession": profession,
      "about": about,
      "profilePic": profilePic,
      "appliedJobs": appliedJobs.map((job) => job.toJSON()).toList(), // Convert applied jobs to JSON
    };
  }

  // This method converts the JSON object to user data
  factory EmployeeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document,
      ) {
    final data = document.data();

    // Convert applied jobs from Firestore map to List<AppliedJob>
    List<AppliedJob> appliedJobs = (data?['appliedJobs'] as List<dynamic>?)
        ?.map((item) => AppliedJob.fromMap(item as Map<String, dynamic>))
        .toList() ?? [];

    return EmployeeModel(
      id: document.id,
      fullName: data?["fullName"],
      email: data?["email"],
      telNo: data?["telNo"],
      profession: data?["profession"],
      about: data?["about"],
      profilePic: data?["profilePic"],
      appliedJobs: appliedJobs,
    );
  }

  EmployeeModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? telNo,
    String? profession,
    String? about,
    String? profilePic,
    List<AppliedJob>? appliedJobs,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      telNo: telNo ?? this.telNo,
      profession: profession ?? this.profession,
      about: about ?? this.about,
      profilePic: profilePic ?? this.profilePic,
      appliedJobs: appliedJobs ?? this.appliedJobs,
    );
  }
}

