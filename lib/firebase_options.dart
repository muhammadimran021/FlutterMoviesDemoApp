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
    apiKey: 'AIzaSyA7yFBM2JzYgVTlvHTdaQp2LyQbRcTrIlo',
    appId: '1:208006823992:web:caf8315a8f35680952a6cd',
    messagingSenderId: '208006823992',
    projectId: 'mymoviesapp-b2701',
    authDomain: 'mymoviesapp-b2701.firebaseapp.com',
    storageBucket: 'mymoviesapp-b2701.firebasestorage.app',
    measurementId: 'G-W5RXG75YP4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA49SdKEmBjaKijxqDOFIaSmBQv-KDVGRE',
    appId: '1:208006823992:android:fedf9f328e8046e052a6cd',
    messagingSenderId: '208006823992',
    projectId: 'mymoviesapp-b2701',
    storageBucket: 'mymoviesapp-b2701.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4TjQ1xS1F73nnDwNYo8rstVMfAjvVF64',
    appId: '1:208006823992:ios:a2694aa632e036ec52a6cd',
    messagingSenderId: '208006823992',
    projectId: 'mymoviesapp-b2701',
    storageBucket: 'mymoviesapp-b2701.firebasestorage.app',
    iosBundleId: 'com.example.myMovieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4TjQ1xS1F73nnDwNYo8rstVMfAjvVF64',
    appId: '1:208006823992:ios:a2694aa632e036ec52a6cd',
    messagingSenderId: '208006823992',
    projectId: 'mymoviesapp-b2701',
    storageBucket: 'mymoviesapp-b2701.firebasestorage.app',
    iosBundleId: 'com.example.myMovieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7yFBM2JzYgVTlvHTdaQp2LyQbRcTrIlo',
    appId: '1:208006823992:web:fd3574c3eb10ba9252a6cd',
    messagingSenderId: '208006823992',
    projectId: 'mymoviesapp-b2701',
    authDomain: 'mymoviesapp-b2701.firebaseapp.com',
    storageBucket: 'mymoviesapp-b2701.firebasestorage.app',
    measurementId: 'G-94R1MKEVQK',
  );
}
