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
    apiKey: 'AIzaSyArHv17kSEFtVzOpE5srVwdMbtaxRUB2J0',
    appId: '1:1033962822081:web:c2422e4d46b4e570707740',
    messagingSenderId: '1033962822081',
    projectId: 'flutterfirebase09',
    authDomain: 'flutterfirebase09.firebaseapp.com',
    storageBucket: 'flutterfirebase09.appspot.com',
    measurementId: 'G-HBTBHHP0VG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANJnNlxeHAOo1zqDugxI6xvB0Al3m6_B8',
    appId: '1:1033962822081:android:2c1d635a9c672fae707740',
    messagingSenderId: '1033962822081',
    projectId: 'flutterfirebase09',
    storageBucket: 'flutterfirebase09.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQSImH9rUR-PSSruhj74qkXJ8XNvbidG4',
    appId: '1:1033962822081:ios:e9a8e0f39b4d4d87707740',
    messagingSenderId: '1033962822081',
    projectId: 'flutterfirebase09',
    storageBucket: 'flutterfirebase09.appspot.com',
    iosClientId: '1033962822081-0o908vtp3okis5vnjoen25q4u6lgk5bl.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterfirebase09',
  );
}