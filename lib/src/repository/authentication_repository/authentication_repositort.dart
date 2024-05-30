import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:jobpoint/src/common_widgets/navigationMenu.dart';
import 'package:jobpoint/src/features/authentication/screens/employee/employeeHome.dart';
import 'package:jobpoint/src/features/authentication/screens/login/user_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<void> createUserWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isLoggedIn.value = true;
      Get.offAll(() => UserLogin());
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
      Get.offAll(() => NavigationMenu()); // Navigate to EmployeeHome after successful login
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (_) {}
  }

  // login with google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
      return null; // Return null in case of exception
    } catch (_) {
      return null; // Return null for any other exception
    }
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