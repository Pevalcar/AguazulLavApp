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
        return android;
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
    apiKey: 'AIzaSyA7z-bTMmoP9JXYNTlm2WPF0WRe4VnLCfg',
    appId: '1:203264626600:web:78b164b602b6644aa7979d',
    messagingSenderId: '203264626600',
    projectId: 'aguazullavapp',
    authDomain: 'aguazullavapp.firebaseapp.com',
    storageBucket: 'aguazullavapp.appspot.com',
    measurementId: 'G-56XTP31LFS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyAXz1pygyDIJTEVjYh3tBN6hT0SiBYKI',
    appId: '1:203264626600:android:0ef93faebf971139a7979d',
    messagingSenderId: '203264626600',
    projectId: 'aguazullavapp',
    storageBucket: 'aguazullavapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzIM6dEtp6aAwlhtnfelDw40b3ryu9hVI',
    appId: '1:203264626600:ios:341e78585cacabc5a7979d',
    messagingSenderId: '203264626600',
    projectId: 'aguazullavapp',
    storageBucket: 'aguazullavapp.appspot.com',
    androidClientId:
        '203264626600-pmokrgsbo3oq4f45g1dk8fhlrfpcu5ph.apps.googleusercontent.com',
    iosClientId:
        '203264626600-2liudnl39s89nlirnsedes5c7nrc1qmn.apps.googleusercontent.com',
    iosBundleId: 'io.pevalcar.aguazullavapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzIM6dEtp6aAwlhtnfelDw40b3ryu9hVI',
    appId: '1:203264626600:ios:7d69550b5ceef5c9a7979d',
    messagingSenderId: '203264626600',
    projectId: 'aguazullavapp',
    storageBucket: 'aguazullavapp.appspot.com',
    androidClientId:
        '203264626600-pmokrgsbo3oq4f45g1dk8fhlrfpcu5ph.apps.googleusercontent.com',
    iosClientId:
        '203264626600-1fpnl9vqlf44m6v86gdj25ev2o18ghsi.apps.googleusercontent.com',
    iosBundleId: 'io.pevalcar.aguazullavapp.RunnerTests',
  );
}