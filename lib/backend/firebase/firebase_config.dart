import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBlwTGUVK0YIDlGaWZ7S8zNbNLSWfyj47Y",
            authDomain: "meganik-22a48.firebaseapp.com",
            projectId: "meganik-22a48",
            storageBucket: "meganik-22a48.appspot.com",
            messagingSenderId: "1084153907686",
            appId: "1:1084153907686:web:6f77954e10ac1fa9eeae27",
            measurementId: "G-KHBJQEF45W"));
  } else {
    await Firebase.initializeApp();
  }
}
