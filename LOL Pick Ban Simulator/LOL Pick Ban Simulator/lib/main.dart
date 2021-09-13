import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/Home/home.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<MyApp> {
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'LOL Pick Ban Simulator',
            home: Home(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'LOL Pick Ban Simulator',
            home: Home(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LOL Pick Ban Simulator',
          home: Home(),
        );
      },
    );
  }
}
