import 'package:get/get.dart';
import '../../../repository/authentication_repository/authentication_repositort.dart';
import '../../../repository/employee_repository/employee_repository.dart';
import '../models/employeeModel.dart';

class EmployeeController extends GetxController {
  static EmployeeController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _employeeRepo = Get.put(EmployeeRepository());
  final employeeData = Rx<EmployeeModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getEmployeeData();
  }

  void getEmployeeData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      try {
        final userData = await _employeeRepo.getUserDetails(email);
        employeeData.value = userData;
      } catch (error) {
        print('Error fetching user data: $error');
        // Handle error if necessary
      }
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
