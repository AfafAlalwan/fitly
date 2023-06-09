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
    apiKey: 'AIzaSyDU-l2AvjJYIxCpbfb9xgZ-KMCT0w4L9NA',
    appId: '1:882186087344:web:b19642cac95e5da79f8475',
    messagingSenderId: '882186087344',
    projectId: 'fitly-ab296',
    authDomain: 'fitly-ab296.firebaseapp.com',
    storageBucket: 'fitly-ab296.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBB0zdqDvOtXgVuSxnhPVW8m9YMdrxIJ20',
    appId: '1:882186087344:android:d84073a9169462349f8475',
    messagingSenderId: '882186087344',
    projectId: 'fitly-ab296',
    storageBucket: 'fitly-ab296.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3nW1fwwAeOfsfhogHFtSKpPpNL14xTw0',
    appId: '1:882186087344:ios:3f6a2f596e0a24f29f8475',
    messagingSenderId: '882186087344',
    projectId: 'fitly-ab296',
    storageBucket: 'fitly-ab296.appspot.com',
    androidClientId: '882186087344-69vh752mkd5ddgnmf0h711mritkbg0ke.apps.googleusercontent.com',
    iosClientId: '882186087344-rmgq94d91jcvj760thvsp5okej5srb7s.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3nW1fwwAeOfsfhogHFtSKpPpNL14xTw0',
    appId: '1:882186087344:ios:3f6a2f596e0a24f29f8475',
    messagingSenderId: '882186087344',
    projectId: 'fitly-ab296',
    storageBucket: 'fitly-ab296.appspot.com',
    androidClientId: '882186087344-69vh752mkd5ddgnmf0h711mritkbg0ke.apps.googleusercontent.com',
    iosClientId: '882186087344-rmgq94d91jcvj760thvsp5okej5srb7s.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitly',
  );
}
