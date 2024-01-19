import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobapp/firebase_options.dart';
import 'package:jobapp/src/repository/authentication_repository/authentication_repositort.dart';

import 'src/common_widgets/first_screen/first_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstWindow(),
      ),
    );
  }
}
