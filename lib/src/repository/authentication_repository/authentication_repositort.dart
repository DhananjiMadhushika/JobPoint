import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jobapp/src/common_widgets/welcom_screen/welcom_screen.dart';
import 'package:jobapp/src/features/authentication/screens/login/employee_login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  // ignore: deprecated_member_use

  late final Rx<User?> firebaseUser; // Rx --- provided the string or get

  @override
  void onReady() {
    // ready function
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeWindow())
        : Get.to(() => const UserLogin());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const WelcomeWindow())
          : Get.to(() => const UserLogin());
    } on FirebaseAuthException catch (e) {}
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Wait for the user to be updated before navigating
      await _auth.authStateChanges().firstWhere((user) => user != null);
      Get.offAll(() => const WelcomeWindow());

      // Navigate to EmployeeHome after a successful login
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (_) {}
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  //Add employee

  Future<void> logout() async => await _auth.signOut();
}
