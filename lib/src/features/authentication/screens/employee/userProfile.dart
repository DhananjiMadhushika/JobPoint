import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobpoint/src/features/authentication/controller/employee_profile_controller.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
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
            padding: const EdgeInsets.all(20),
            child: Obx(() {
              if (profileController.employee.value.email == null ||
                  profileController.employee.value.email!.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              final employee = profileController.employee.value;
              return Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: employee.profilePic != null
                        ? NetworkImage(employee.profilePic!) // Changed from MemoryImage to NetworkImage
                        : AssetImage('assets/images/profile1.jpg') as ImageProvider,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await profileController.pickAndUploadImage();
                    },
                    child: Text('Upload Profile Picture'),
                  ),
                  const SizedBox(height: 20),
                  itemProfile('Name', employee.fullName ?? '', CupertinoIcons.person),
                  const SizedBox(height: 10),
                  itemProfile('Phone', employee.telNo ?? '', CupertinoIcons.phone),
                  const SizedBox(height: 10),
                  itemProfile('Profession', employee.profession ?? '', CupertinoIcons.briefcase),
                  const SizedBox(height: 10),
                  itemProfile('Email', employee.email ?? '', CupertinoIcons.mail),
                  const SizedBox(height: 20),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.blueAccent.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
