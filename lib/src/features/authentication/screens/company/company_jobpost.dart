import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobpoint/src/features/authentication/screens/company/postJob.dart';

import '../../../../repository/authentication_repository/authentication_repositort.dart';
import '../../controller/company_controller.dart';
import '../../models/companyModel.dart';
import '../employee/employeeHome.dart';
import '../employee/userProfile.dart';
import '../login/user_login.dart';
import 'companyHome.dart';

class CompanyJob extends StatefulWidget {
  const CompanyJob({super.key});

  @override
  State<CompanyJob> createState() => _CompanyJobState();
}

class _CompanyJobState extends State<CompanyJob> {

  final _controller = Get.put(CompanyController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Posted jobs",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<CompanyModel>>(
                future: _controller.getCompanyData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        CompanyModel company = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(CompanyDetails(),
                                arguments: company); // Pass the company object as an argument
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 5, 6, 70),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 8,
                              left: 8,
                              right: 8,
                              top: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      company.imageUrl, // Use company's image URL here
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    company.position,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    company.companyName ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    company.headOffice ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      const SizedBox(width: 165),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "More info",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Add other details as needed
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No data available'));
                  }
                },
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                // Navigate to the PostJob screen when the button is tapped
                Get.to(PostJob());
              },
              child: Container(
                height: 40,
                width: 180,
                margin: EdgeInsets.only(left: 180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(158, 164, 161, 172),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Post a new job",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 250,
            )
          ],
        ),
      ),
    );
  }
}
