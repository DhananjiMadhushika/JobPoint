// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBxjQClpQYQuQBqawDT2x4V_p4vz9Snqdk',
    appId: '1:444590398241:web:304e05b4e394227751bc60',
    messagingSenderId: '444590398241',
    projectId: 'mobile-application-proje-7c33f',
    authDomain: 'mobile-application-proje-7c33f.firebaseapp.com',
    storageBucket: 'mobile-application-proje-7c33f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA0e0G4dK6wmBkiiXFlnDU45kQYel0ZPc',
    appId: '1:444590398241:android:f16f530a04e9485751bc60',
    messagingSenderId: '444590398241',
    projectId: 'mobile-application-proje-7c33f',
    storageBucket: 'mobile-application-proje-7c33f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxBmXdmG0GJbl3sUn8dRtIF95Z4liUeGA',
    appId: '1:444590398241:ios:51f735da33bcc0f051bc60',
    messagingSenderId: '444590398241',
    projectId: 'mobile-application-proje-7c33f',
    storageBucket: 'mobile-application-proje-7c33f.appspot.com',
    iosBundleId: 'com.example.jobapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxBmXdmG0GJbl3sUn8dRtIF95Z4liUeGA',
    appId: '1:444590398241:ios:c21b74a1baed63bd51bc60',
    messagingSenderId: '444590398241',
    projectId: 'mobile-application-proje-7c33f',
    storageBucket: 'mobile-application-proje-7c33f.appspot.com',
    iosBundleId: 'com.example.jobapp.RunnerTests',
  );
}
