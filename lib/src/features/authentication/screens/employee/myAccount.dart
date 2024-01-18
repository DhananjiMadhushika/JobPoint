import 'package:flutter/material.dart';
import 'package:jobapp/src/features/authentication/screens/signup/employee_register.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isLoggedIn = false; // Replace this with your actual login status check

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: isLoggedIn ? EmployeeRegister() : MyAccountContent(),
    );
  }
}

class MyAccountContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
                'assets/default_avatar.png'), // Add your default image asset
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  // Add logic to handle camera icon press
                  // This could open a camera or gallery for image selection
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          UserDetailsForm(),
        ],
      ),
    );
  }
}

class UserDetailsForm extends StatefulWidget {
  @override
  _UserDetailsFormState createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController telNoController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Details',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: telNoController,
          decoration: InputDecoration(labelText: 'Tel No'),
        ),
        TextField(
          controller: professionController,
          decoration: InputDecoration(labelText: 'Profession'),
        ),
        TextField(
          controller: birthDateController,
          decoration: InputDecoration(labelText: 'Birth Date'),
        ),
        TextField(
          controller: locationController,
          decoration: InputDecoration(labelText: 'Location'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Add logic to save user details
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
