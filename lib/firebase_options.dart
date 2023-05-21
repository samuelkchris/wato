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
    apiKey: 'AIzaSyAj4IpLnY-MDn3l6VeCkQPSMpTAH3L_hs8',
    appId: '1:777689608195:web:25b73139bcb8274caede36',
    messagingSenderId: '777689608195',
    projectId: 'wato-ac064',
    authDomain: 'wato-ac064.firebaseapp.com',
    databaseURL: 'https://wato-ac064-default-rtdb.firebaseio.com',
    storageBucket: 'wato-ac064.appspot.com',
    measurementId: 'G-12LW3H3W4H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxVYUINNULj_tntayyKIeHvoXky4md21s',
    appId: '1:777689608195:android:ec0de246e6a4158eaede36',
    messagingSenderId: '777689608195',
    projectId: 'wato-ac064',
    databaseURL: 'https://wato-ac064-default-rtdb.firebaseio.com',
    storageBucket: 'wato-ac064.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsXh0wrKty_wjLx0Cuxh2t1ISfn0HkoL4',
    appId: '1:777689608195:ios:653c359a56e01625aede36',
    messagingSenderId: '777689608195',
    projectId: 'wato-ac064',
    databaseURL: 'https://wato-ac064-default-rtdb.firebaseio.com',
    storageBucket: 'wato-ac064.appspot.com',
    androidClientId: '777689608195-k3a05a0kampstp8u7pbahr5k044ml1oa.apps.googleusercontent.com',
    iosClientId: '777689608195-cne0sb563p5ju1kfefo8snvoej8b575k.apps.googleusercontent.com',
    iosBundleId: 'com.example.wato',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsXh0wrKty_wjLx0Cuxh2t1ISfn0HkoL4',
    appId: '1:777689608195:ios:653c359a56e01625aede36',
    messagingSenderId: '777689608195',
    projectId: 'wato-ac064',
    databaseURL: 'https://wato-ac064-default-rtdb.firebaseio.com',
    storageBucket: 'wato-ac064.appspot.com',
    androidClientId: '777689608195-k3a05a0kampstp8u7pbahr5k044ml1oa.apps.googleusercontent.com',
    iosClientId: '777689608195-cne0sb563p5ju1kfefo8snvoej8b575k.apps.googleusercontent.com',
    iosBundleId: 'com.example.wato',
  );
}
