import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/employee_controller.dart'; // Import your EmployeeController

class AppliedJob extends StatelessWidget {
  final _controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Applied Jobs",
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
                child: Obx(
                      () => ListView.builder(
                    itemCount: _controller.employeeData.value?.appliedJobs.length ?? 0,
                    itemBuilder: (context, index) {
                      final appliedJob = _controller.employeeData.value?.appliedJobs[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 10),
                        color: Colors.blueGrey, // Set blue-grey background color
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: appliedJob?.imageUrl != null && appliedJob!.imageUrl!.isNotEmpty
                                    ? Image.network(
                                  appliedJob.imageUrl!, // Image URL, forced non-nullable
                                  width: 65,
                                  height: 65, // Add height to ensure placeholder displays properly
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.image_not_supported,
                                      size: 45,
                                      color: Colors.grey,
                                    ); // Display an icon if the image fails to load
                                  },
                                )
                                    : Icon(
                                  Icons.image_not_supported,
                                  size: 45,
                                  color: Colors.grey,
                                ), // Display an icon if the image URL is null or empty
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    appliedJob?.position ?? '',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // Text color for contrast
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    appliedJob?.companyName ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: const Color.fromARGB(179, 240, 240, 240), // Light color for contrast
                                    ),
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    appliedJob?.status ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: const Color.fromARGB(179, 240, 240, 240),
                                      // Light color for contrast
                                    ),
                                  ),

                                ],
                              ),



                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
