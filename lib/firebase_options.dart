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
    apiKey: 'AIzaSyDst-Q5jECmfe7RT8FzBjsHTTmaABaZvok',
    appId: '1:561650211560:web:6c546c6b7140513105875d',
    messagingSenderId: '561650211560',
    projectId: 'travel-729d3',
    authDomain: 'travel-729d3.firebaseapp.com',
    storageBucket: 'travel-729d3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8xMd8BHZGDg5uXJks8Uw0tZi07Ql6OuE',
    appId: '1:561650211560:android:40dec5dc1182754605875d',
    messagingSenderId: '561650211560',
    projectId: 'travel-729d3',
    storageBucket: 'travel-729d3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCc_ZyZkJR6tdZtzIMDw84XiuDrlzzR0pc',
    appId: '1:561650211560:ios:f4752995334dcc8705875d',
    messagingSenderId: '561650211560',
    projectId: 'travel-729d3',
    storageBucket: 'travel-729d3.appspot.com',
    androidClientId: '561650211560-6cd9s87q5cds2nvedvv6bbmfl6vplh4q.apps.googleusercontent.com',
    iosClientId: '561650211560-hr0ld0kkhe3sv3i69rig6gvavs6elpa1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chandoiqua',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCc_ZyZkJR6tdZtzIMDw84XiuDrlzzR0pc',
    appId: '1:561650211560:ios:905bf1681384bce405875d',
    messagingSenderId: '561650211560',
    projectId: 'travel-729d3',
    storageBucket: 'travel-729d3.appspot.com',
    androidClientId: '561650211560-6cd9s87q5cds2nvedvv6bbmfl6vplh4q.apps.googleusercontent.com',
    iosClientId: '561650211560-pb0l4gd1v8vgngffvdeg2l9hvc388u29.apps.googleusercontent.com',
    iosBundleId: 'com.example.chandoiqua.RunnerTests',
  );
}
