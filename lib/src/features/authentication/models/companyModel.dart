import 'package:cloud_firestore/cloud_firestore.dart';

class Application {
  final String applicantName;
  final String position;
  final String resumeUrl; // Assuming the resume is stored as a URL

  Application({
    required this.applicantName,
    required this.position,
    required this.resumeUrl,
  });

  // Factory constructor to create an Application object from a Firestore map
  factory Application.fromMap(Map<String, dynamic> data) {
    return Application(
      applicantName: data['applicantName'],
      position: data['position'],
      resumeUrl: data['resumeUrl'],
    );
  }

  // Convert Application object to JSON
  Map<String, dynamic> toJSON() {
    return {
      "applicantName": applicantName,
      "position": position,
      "resumeUrl": resumeUrl,
    };
  }
}

class CompanyModel {
  final String? id;
  final String? companyName;
  final String? email;
  final String position;
  final String description;
  final String jobPosterEmail;
  final String employeeSize;
  final String headOffice;
  final String imageUrl;
  final List<Application> applications; // List of applications

  CompanyModel({
    this.id,
    required this.companyName,
    required this.email,
    required this.position,
    required this.description,
    required this.jobPosterEmail,
    required this.employeeSize,
    required this.headOffice,
    required this.imageUrl,
    this.applications = const [], // Initialize with an empty list by default
  });

  // Factory constructor to create a CompanyModel object from a Firestore snapshot
  factory CompanyModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;

    // Convert applications from Firestore map to List<Application>
    List<Application> applications = (data['applications'] as List<dynamic>?)
        ?.map((item) => Application.fromMap(item as Map<String, dynamic>))
        .toList() ?? [];

    return CompanyModel(
      id: snapshot.id,
      companyName: data['companyName'],
      email: data['email'],
      position: data['position'],
      description: data['description'],
      jobPosterEmail: data['jobPosterEmail'],
      employeeSize: data['employeeSize'],
      headOffice: data['headOffice'],
      imageUrl: data['imageUrl'],
      applications: applications,
    );
  }

  // Convert CompanyModel object to JSON
  Map<String, dynamic> toJSON() {
    return {
      "companyName": companyName,
      "email": email,
      "position": position,
      "description": description,
      "jobPosterEmail": jobPosterEmail,
      "employeeSize": employeeSize,
      "headOffice": headOffice,
      "imageUrl": imageUrl,
      "applications": applications.map((app) => app.toJSON()).toList(), // Convert applications to JSON
    };
  }
}
