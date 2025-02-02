// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA4rUmZ-EML_N7tGrTQMBge-tgSil9X6DM',
    appId: '1:977321573103:web:1d59f0cd6c61a1f869f91a',
    messagingSenderId: '977321573103',
    projectId: 'mis-joke-app',
    authDomain: 'mis-joke-app.firebaseapp.com',
    storageBucket: 'mis-joke-app.firebasestorage.app',
    measurementId: 'G-JKXDX2D2HL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiWKTifKJekrKev9MaYTTmaI5mhSyGgow',
    appId: '1:977321573103:android:3027742a087eda0969f91a',
    messagingSenderId: '977321573103',
    projectId: 'mis-joke-app',
    storageBucket: 'mis-joke-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNFYXa2-qrvXgqXhdxjx40ZrTdNMItsSs',
    appId: '1:977321573103:ios:9e07393c16c4e26569f91a',
    messagingSenderId: '977321573103',
    projectId: 'mis-joke-app',
    storageBucket: 'mis-joke-app.firebasestorage.app',
    iosBundleId: 'mk.ukim.finki.lab3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNFYXa2-qrvXgqXhdxjx40ZrTdNMItsSs',
    appId: '1:977321573103:ios:9e07393c16c4e26569f91a',
    messagingSenderId: '977321573103',
    projectId: 'mis-joke-app',
    storageBucket: 'mis-joke-app.firebasestorage.app',
    iosBundleId: 'mk.ukim.finki.lab3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA4rUmZ-EML_N7tGrTQMBge-tgSil9X6DM',
    appId: '1:977321573103:web:2da09858e679b12169f91a',
    messagingSenderId: '977321573103',
    projectId: 'mis-joke-app',
    authDomain: 'mis-joke-app.firebaseapp.com',
    storageBucket: 'mis-joke-app.firebasestorage.app',
    measurementId: 'G-7BFQNXRRQZ',
  );

}