import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quickjob/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text('error');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => SignUp())));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Center(
            child: Text('Splash Screen'),
          ),
        ),
      ),
    );
  }
}
