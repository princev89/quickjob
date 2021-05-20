import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickjob/pages/home.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({Key key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
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
          'Update Profile',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      'Set Profile To Continue',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.inactiveGray,
                          fontSize: 28),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        autofocus: false,
                        controller: _nameController,
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.person_2,
                                color: Colors.black45,
                              ),
                            ),
                            hintText: 'Full Name '),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        autofocus: false,
                        controller: _usernameController,
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                CupertinoIcons.person,
                                color: Colors.black45,
                              ),
                            ),
                            hintText: 'username'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                                CupertinoIcons.mail,
                                color: Colors.black45,
                              ),
                            ),
                            hintText: 'Email'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        //set profile
                        print('updating profile');
                        if (auth.currentUser != null) print('user');
                        print('no user');

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: CupertinoColors.activeBlue,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            'Set Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
