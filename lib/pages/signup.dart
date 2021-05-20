import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickjob/pages/login.dart';
import 'package:quickjob/pages/updateprofile.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _error = TextEditingController();
  bool showpassword = false;

  Future loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => UpdateProfile()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        setState(() {
          _error.text = 'The password provided is too weak.';
        });
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        _error.text = 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }

    // FirebaseAuth auth = FirebaseAuth.instance;
    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: "+91" + phone,
    //   timeout: Duration(seconds: 10),
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     print('OTP Sent');
    //   },
    //   verificationFailed: (FirebaseAuthException e) async {
    //     print('The provided phone number is not valid.');
    //   },
    //   codeSent: (String verificationId, int resendToken) async {
    //     showDialog(
    //         context: context,
    //         barrierDismissible: false,
    //         builder: (context) {
    //           return AlertDialog(
    //             title: Text("Give the code?"),
    //             content: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: <Widget>[
    //                 TextField(
    //                   controller: _codeController,
    //                 ),
    //               ],
    //             ),
    //             actions: <Widget>[
    //               // ignore: deprecated_member_use
    //               FlatButton(
    //                 child: Text("Confirm"),
    //                 textColor: Colors.white,
    //                 color: Colors.blue,
    //                 onPressed: () async {
    //                   print('clicked');

    //                   final code = _codeController.text.trim();

    //                   try {
    //                     PhoneAuthCredential credential =
    //                         PhoneAuthProvider.credential(
    //                             verificationId: verificationId, smsCode: code);
    //                     if (auth.currentUser != null) {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (BuildContext context) =>
    //                                   UpdateProfile()));
    //                     }
    //                   } on FirebaseAuthException catch (e) {
    //                     print('Failed with error code: ${e.code}');
    //                     print(e.message);
    //                   }
    //                 },
    //               )
    //             ],
    //           );
    //         });
    //     //
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://image.freepik.com/free-vector/usability-testing-concept-illustration_114360-1571.jpg')),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    height: 300,
                  ),
                  Text(_error.text),
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
                          'Sign Up',
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
                              builder: (BuildContext context) => Login()));
                    },
                    child: Center(
                      child: Text(
                        'Already have an account?',
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
