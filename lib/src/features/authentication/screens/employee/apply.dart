import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/uploadFile.dart';
import '../../controller/application_controller.dart';
import '../../models/companyModel.dart';

class ApplyJob extends StatelessWidget {
  final _controller = Get.put(ApplicationController());
  late final CompanyModel company;
  String? companyId;
  String? employeeEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    company = Get.arguments as CompanyModel;
    companyId = company.id;

    return Scaffold(
      body: SingleChildScrollView(
        child: employeeEmail == null
            ? Center(child: Text('No email found for current user'))
            : FutureBuilder<String?>(
          future: _controller.getLogedEmployeeId(employeeEmail!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final employeeId = snapshot.data;
              if (employeeId == null) {
                return Center(child: Text('No employee ID found'));
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Job',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Point',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: 350,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            "Apply for a Job",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      child: TextFormField(
                        controller: _controller.applicantName,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      child: TextFormField(
                        controller: _controller.applicantEmail,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      child: TextFormField(
                        controller: _controller.applyPosition,
                        decoration: const InputDecoration(
                          labelText: 'Position',
                          labelStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  UploadFile(onFileUploaded: (url) {
                    _controller.resumeUrl.value = url;
                  }),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _controller.uploadResume();
                          if (companyId != null && employeeId != null) {
                            _controller.applyForJob(companyId!, employeeId);
                          } else {
                            Get.snackbar('Error', 'Company or Employee ID is null',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No employee data found'));
            }
          },
        ),
      ),
    );
  }
}
