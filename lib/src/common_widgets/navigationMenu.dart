import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/features/authentication/screens/company/company_jobpost.dart';
import 'package:jobpoint/src/features/authentication/screens/employee/employeeHome.dart';

import '../features/authentication/screens/employee/appliedJob.dart';
import '../features/authentication/screens/employee/userProfile.dart';
import '../features/authentication/screens/login/user_login.dart';
import '../repository/authentication_repository/authentication_repositort.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final String userEmail = FirebaseAuth.instance.currentUser?.email ?? 'No Email';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  RichText(
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
                ],
              ),
            ),
            SizedBox(width: 110),
            Container(
              width: 80,
              height: 100,
              child: Image.asset(
                  'assets/images/back_girl.png'), // Replace 'your_image_path.png' with the actual path to your image asset
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 199, 198, 201),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF2882B5)),
              accountName: const Text(
                "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                userEmail,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: const FlutterLogo(),
            ),
            // Profile ListTile
            ListTile(
              leading: const Icon(Icons.person), // Profile icon
              title: const Text('My Profile'),
              onTap: () {
                Get.to(() => UserProfile());
              },
            ),
            // Logout ListTile
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                // Handle the logout action
                await AuthenticationRepository.instance.logout();
                // Navigate to the login screen after logout
                Get.offAll(() => const UserLogin());
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
          controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens =  [EmployeeHome(), AppliedJob(), CompanyJob()];
}
