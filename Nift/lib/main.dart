import 'package:Nift/home_page.dart';
import 'package:flutter/material.dart';
import 'package:Nift/welcome_page.dart';
import 'regestration_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(NIFT());
}

class NIFT extends StatefulWidget {
  @override
  _NIFTState createState() => _NIFTState();
}

class _NIFTState extends State<NIFT> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return AlertDialog(
            title: Text('Something went wrong please restart the app'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: ThemeData.light().copyWith(),
            initialRoute: '/homepage',
            routes: {
              //  '/': (context) => WelcomePage(),
              '/homepage': (context) => HomePage(),
              '/regestration': (context) => RegistrationScreen(),
            },
          );
        }
      },
    );
  }
}
