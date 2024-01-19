import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:jobapp/src/features/authentication/screens/employee/employeeHome.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  late final Rx<User?> firebaseUser;
  late final RxBool isLoggedIn = RxBool(false);

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isLoggedIn.value = true;
      Get.offAll(() => EmployeeHome());
    } on FirebaseAuthException catch (e) {
      print(e);
      // Handle the exception (e.g., show an error message)
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _auth.authStateChanges().firstWhere((user) => user != null);
      isLoggedIn.value = true;
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (_) {}
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      print("Logged out successfully.");
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
