import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobapp/src/features/authentication/controller/employee_profile_controller.dart';
import 'package:jobapp/src/features/authentication/models/employeeModel.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({Key? key}) : super(key: key);

  @override
  _ProfileWindowState createState() => _ProfileWindowState();
}

class _ProfileWindowState extends State<EmployeeProfile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    EmployeeModel employeedata = snapshot.data as EmployeeModel;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back_outlined),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Profile",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            height: 100, // Adjust the height as needed
                            width: 0, // Adjust the width as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset("assets/images/2.jpg",
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Change profile Picture",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 25),
                        const Text(
                          "Profile Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Name"),
                            Expanded(
                              child: TextFormField(
                                controller: controller.fullName,
                                initialValue: employeedata.fullName,
                                style: const TextStyle(
                                  color: Color.fromARGB(66, 163, 162, 162),
                                ),
                              ),
                            ),
                            Icon(Icons.edit),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Email   :"),
                            Expanded(
                              child: TextFormField(
                                controller: controller.email,
                                initialValue: employeedata.email,
                                style: TextStyle(
                                  color: Color.fromARGB(66, 163, 162, 162),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 25),
                        const Text(
                          "Personal Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Phone Number   :"),
                            Expanded(
                              child: TextFormField(
                                controller: controller.telNo,
                                initialValue: employeedata.telNo,
                                style: TextStyle(
                                  color: Color.fromARGB(66, 163, 162, 162),
                                ),
                              ),
                            ),
                            Icon(Icons.edit),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Profession   :"),
                            Expanded(
                              child: TextFormField(
                                controller: controller.profession,
                                initialValue: employeedata.profession,
                                style: TextStyle(
                                  color: Color.fromARGB(66, 163, 162, 162),
                                ),
                              ),
                            ),
                            Icon(Icons.edit),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 100,
                          width: 360,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 156, 159, 161),
                              width: 2.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Container(
                                    child: const Text("About"),
                                  ),
                                  const Spacer(),
                                  Container(
                                    child: Icon(Icons.edit),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "About You",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 159, 161),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
