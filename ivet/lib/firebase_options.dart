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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBPyVnEii5OveBsm3jJhcVng_7nfyKcmis',
    appId: '1:556510451754:web:b3efe6767c830e30e7cb53',
    messagingSenderId: '556510451754',
    projectId: 'ivet-db2022',
    authDomain: 'ivet-db2022.firebaseapp.com',
    storageBucket: 'ivet-db2022.appspot.com',
    measurementId: 'G-XCCRPCNHFJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4rgjJVYn9C_wqRqYIPTbuDNJG0ZEdTqE',
    appId: '1:556510451754:android:f449274431df3e46e7cb53',
    messagingSenderId: '556510451754',
    projectId: 'ivet-db2022',
    storageBucket: 'ivet-db2022.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpQFLJqNirNwlps9b8S0uzXvHdWZz4rds',
    appId: '1:556510451754:ios:abbf159069af9612e7cb53',
    messagingSenderId: '556510451754',
    projectId: 'ivet-db2022',
    storageBucket: 'ivet-db2022.appspot.com',
    iosClientId: '556510451754-23fc8sv72oe74v51u1hit6avqa2do20f.apps.googleusercontent.com',
    iosBundleId: 'com.example.ivet',
  );
}