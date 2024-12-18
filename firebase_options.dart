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
    apiKey: 'AIzaSyAwcj0mPdu_0gDxv-IzzF6ulX6GZfRilXk',
    appId: '1:382376958676:web:3108a5e48d60ce53083941',
    messagingSenderId: '382376958676',
    projectId: 'projeto-paf',
    authDomain: 'projeto-paf.firebaseapp.com',
    storageBucket: 'projeto-paf.firebasestorage.app',
    measurementId: 'G-C0BEF22X7G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyComUxbwRumJpj0IOeHDFS_1abIqNM3PM8',
    appId: '1:382376958676:android:b0af02350fa85977083941',
    messagingSenderId: '382376958676',
    projectId: 'projeto-paf',
    storageBucket: 'projeto-paf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-qxtSiQtghU6V5OWuBgdwbK7uvcvaQ9g',
    appId: '1:382376958676:ios:d1eeae21562fe7a7083941',
    messagingSenderId: '382376958676',
    projectId: 'projeto-paf',
    storageBucket: 'projeto-paf.firebasestorage.app',
    iosClientId: '382376958676-qddn6143s1qs7175rmrafvmsojljqa4r.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-qxtSiQtghU6V5OWuBgdwbK7uvcvaQ9g',
    appId: '1:382376958676:ios:d1eeae21562fe7a7083941',
    messagingSenderId: '382376958676',
    projectId: 'projeto-paf',
    storageBucket: 'projeto-paf.firebasestorage.app',
    iosClientId: '382376958676-qddn6143s1qs7175rmrafvmsojljqa4r.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled5',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAwcj0mPdu_0gDxv-IzzF6ulX6GZfRilXk',
    appId: '1:382376958676:web:69f897201725bf46083941',
    messagingSenderId: '382376958676',
    projectId: 'projeto-paf',
    authDomain: 'projeto-paf.firebaseapp.com',
    storageBucket: 'projeto-paf.firebasestorage.app',
    measurementId: 'G-RMB9BCVL66',
  );

}