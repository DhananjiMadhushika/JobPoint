
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/features/authentication/controller/company_controller.dart';

class PostJob extends StatelessWidget {
  final _controller = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                height: 70,
                width: 350,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Post a Job",
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
                height: 60,
                width: 320,
                child: TextFormField(
                  controller: _controller.companyName,
                  decoration: InputDecoration(
                    labelText: 'Company Name',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 320,
                child: TextFormField(
                  controller: _controller.companyEmail,
                  decoration: InputDecoration(
                    labelText: 'Company Email',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 320,
                child: TextFormField(
                  controller: _controller.position,
                  decoration: InputDecoration(
                    labelText: 'Position',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 320,
                child: TextFormField(
                  controller: _controller.companyDescription,
                  decoration: InputDecoration(
                    labelText: 'Company Description',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 320,
                child: TextFormField(
                  controller: _controller.employeeSize,
                  decoration: InputDecoration(
                    labelText: 'Employee Size',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 320,
                child: TextFormField(
                  controller: _controller.headOffice,
                  decoration: InputDecoration(
                    labelText: 'Head Office',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.uploadImage();
              },
              child: Text('Upload Image'),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: _controller.saveCompanyDetails,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
