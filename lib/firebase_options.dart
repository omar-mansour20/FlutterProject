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
    apiKey: 'AIzaSyDzbm0q1WoBCehPLTlBLzYGphGjibKwdp8',
    appId: '1:605610243444:web:10034d697084f40c65e821',
    messagingSenderId: '605610243444',
    projectId: 'fluttercourse-b59fa',
    authDomain: 'fluttercourse-b59fa.firebaseapp.com',
    storageBucket: 'fluttercourse-b59fa.appspot.com',
    measurementId: 'G-Z2GBM8RPQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0geGnlseRKvxKEyM8YodpJuelB2dUpA8',
    appId: '1:605610243444:android:ada929412ecee92365e821',
    messagingSenderId: '605610243444',
    projectId: 'fluttercourse-b59fa',
    storageBucket: 'fluttercourse-b59fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADrrM4KAPV01WSdWCw7NCpdEsVLR2mObA',
    appId: '1:605610243444:ios:95dc8c84f05f5f9965e821',
    messagingSenderId: '605610243444',
    projectId: 'fluttercourse-b59fa',
    storageBucket: 'fluttercourse-b59fa.appspot.com',
    iosBundleId: 'com.example.hotelReservationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADrrM4KAPV01WSdWCw7NCpdEsVLR2mObA',
    appId: '1:605610243444:ios:95dc8c84f05f5f9965e821',
    messagingSenderId: '605610243444',
    projectId: 'fluttercourse-b59fa',
    storageBucket: 'fluttercourse-b59fa.appspot.com',
    iosBundleId: 'com.example.hotelReservationProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDzbm0q1WoBCehPLTlBLzYGphGjibKwdp8',
    appId: '1:605610243444:web:d15b1eb43277194965e821',
    messagingSenderId: '605610243444',
    projectId: 'fluttercourse-b59fa',
    authDomain: 'fluttercourse-b59fa.firebaseapp.com',
    storageBucket: 'fluttercourse-b59fa.appspot.com',
    measurementId: 'G-T9KZ3DR99V',
  );
}
