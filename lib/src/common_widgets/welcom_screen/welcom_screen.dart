import 'package:flutter/material.dart';
import 'package:jobapp/src/features/authentication/screens/company/companyHome.dart';
import 'package:jobapp/src/features/authentication/screens/employee/employeeHome.dart';

class WelcomeWindow extends StatelessWidget {
  const WelcomeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Image.asset(
              "assets/images/1.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: 250,
              child: const Center(
                child: Text("Find the Right Job or Internship for You",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EmployeeHome()),
                );
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF2882B5), width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text("Employee", style: TextStyle(color: Colors.blue)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: 250,
              child: const Center(
                child: Text("Post Your Job for Millions of People See",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CompanyHome()),
                );
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF2882B5), width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text("Company", style: TextStyle(color: Colors.blue)),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
