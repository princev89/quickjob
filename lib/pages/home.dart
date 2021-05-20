import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          child: Text('nice'),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 40,
        title: Text(
          'Quick Job',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Hello ' + FirebaseAuth.instance.currentUser.displayName),
          ],
        ),
      ),
    );
  }
}
