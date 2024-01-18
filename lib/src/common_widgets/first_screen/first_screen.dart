import 'package:flutter/material.dart';
import 'package:jobapp/src/common_widgets/welcom_screen/welcom_screen.dart';

class FirstWindow extends StatelessWidget {
  const FirstWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            SizedBox(
              height: 600,
              width: double.infinity,
              child: Image.asset(
                "assets/logo/app_logo.png",
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeWindow()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xFF356899),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text("Get Started",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
