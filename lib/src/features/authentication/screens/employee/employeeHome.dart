import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/common_widgets/welcom_screen/welcom_screen.dart';
import 'package:jobpoint/src/features/authentication/screens/company/companyHome.dart';
import 'package:jobpoint/src/features/authentication/screens/employee/myAccount.dart';
import 'package:jobpoint/src/features/authentication/screens/employee/userProfile.dart';
import 'package:jobpoint/src/features/authentication/screens/employee/viewJobs.dart';
import 'package:jobpoint/src/features/authentication/screens/login/user_login.dart';
import 'package:jobpoint/src/repository/authentication_repository/authentication_repositort.dart';

import '../../controller/company_controller.dart';
import '../../models/companyModel.dart';
import '../company/company_jobpost.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EmployeeHome> {
  final _controller = Get.put(CompanyController());

  // Method to generate random dark color
  Color getRandomDarkColor() {
    Random random = Random();
    int r = random.nextInt(128); // Limit to darker range
    int g = random.nextInt(128); // Limit to darker range
    int b = random.nextInt(128); // Limit to darker range
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search a job or position',
                  filled: true,
                  fillColor: Color.fromARGB(255, 226, 225, 225),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("Popular jobs",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<CompanyModel>>(
                future: _controller.getAllCompanyData(),
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
                            Get.to(ViewJobs(), arguments: company); // Pass the company object as an argument
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: getRandomDarkColor(), // Set random dark color
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.only(
                              bottom: 8,
                              left: 8,
                              right: 8,
                              top: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: ClipOval(
                                      child: Image.network(
                                        company.imageUrl ?? '',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    company.position ?? '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    company.companyName ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    company.headOffice ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(height: 25),
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
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Recent Jobs",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(52, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/login/googles.png',
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Software Engineer",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Sysco Lab",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(179, 170, 166, 166),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      "\$96000/y",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(179, 90, 88, 88),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Colombo, Sri Lanka",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(179, 165, 157, 157),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(52, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/login/googles.png',
                                    width: 45,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Software Engineer",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Sysco Lab",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(179, 170, 166, 166),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(
                                      "\$96000/y",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(179, 90, 88, 88),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Colombo, Sri Lanka",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: const Color.fromARGB(179, 165, 157, 157),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
