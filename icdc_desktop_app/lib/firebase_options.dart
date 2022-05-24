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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBHcnxX4cPlcl1vgivb8G7p4jvXn0U9fYc',
    appId: '1:984989534583:web:f3de9f0ee7d1bbaa437972',
    messagingSenderId: '984989534583',
    projectId: 'icdc-imus-cms',
    authDomain: 'icdc-imus-cms.firebaseapp.com',
    storageBucket: 'icdc-imus-cms.appspot.com',
    measurementId: 'G-3GSQCV6XTQ',
  );

/*
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNp41jgIjdPtqjYhhJIpqYbS-QxKa593M',
    appId: '1:984989534583:android:cddaff630da72eeb437972',
    messagingSenderId: '984989534583',
    projectId: 'icdc-imus-cms',
    storageBucket: 'icdc-imus-cms.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzrdZ0St5HgiPgd53FWvLTn8iz4o8s2hU',
    appId: '1:984989534583:ios:c87c68dd1a7a9f5b437972',
    messagingSenderId: '984989534583',
    projectId: 'icdc-imus-cms',
    storageBucket: 'icdc-imus-cms.appspot.com',
    iosClientId: '984989534583-p5n1j3i16a2advdsrf2lir6ooja6ami9.apps.googleusercontent.com',
    iosBundleId: 'com.example.icdcDesktopApp',
  );
*/

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBHcnxX4cPlcl1vgivb8G7p4jvXn0U9fYc',
    appId: '1:984989534583:web:34aca5c8371f406b437972',
    messagingSenderId: '984989534583',
    projectId: 'icdc-imus-cms',
    authDomain: 'icdc-imus-cms.firebaseapp.com',
    storageBucket: 'icdc-imus-cms.appspot.com',
    measurementId: 'G-SGR782380S',
  );
}
