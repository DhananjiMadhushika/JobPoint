import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/companyModel.dart';
import '../employee/apply.dart';

class ViewJobs extends StatefulWidget {
  const ViewJobs({Key? key}) : super(key: key);

  @override
  State<ViewJobs> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<ViewJobs> {
  @override
  Widget build(BuildContext context) {
    final CompanyModel? company = Get.arguments as CompanyModel?;
    if (company == null) {
      // Handle the case where company is null
      return Scaffold(
        body: Center(
          child: Text('Company data not available'),
        ),
      );
    }

    final String imageUrl = company.imageUrl;
    print("Image URL: $imageUrl"); // Debug print

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl), // Load company's image dynamically
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 130),
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  color: Colors.black26,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Software Company",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              company.companyName ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Company Name",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                  company.companyName ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black, // Changed from white to black for better visibility
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                  company.description,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal, // Normal font weight for description
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Position",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                  company.position,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Employee Size",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                  "${company.employeeSize} Employees",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Head Office",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 340,
                margin: EdgeInsets.only(left: 18, right: 10),
                child: Text(
                  company.headOffice,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ApplyJob(),
                          arguments: company);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Button color
                    ),
                    child: const Text('Apply'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
