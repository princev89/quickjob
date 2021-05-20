import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickjob/pages/home.dart';
import 'package:quickjob/pages/signup.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _error = TextEditingController();
  bool showpassword = false;

  Future loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Home()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error.text = e.code;
      });
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.activeBlue,
        toolbarHeight: 40,
        title: Text(
          'Login',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://image.freepik.com/free-vector/usability-testing-concept-illustration_114360-1571.jpg')),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 32),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      autofocus: false,
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.email,
                              color: Colors.black45,
                            ),
                          ),
                          hintText: 'Email '),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      obscureText: showpassword,
                      autofocus: false,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showpassword == false
                                      ? showpassword = true
                                      : showpassword = false;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          hintText: 'Password '),
                    ),
                  ),
                  Text(
                    _error.text.toUpperCase(),
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginUser();
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignUp()));
                    },
                    child: Center(
                      child: Text(
                        'Do not have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
