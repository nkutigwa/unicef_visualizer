import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConfirmEmail extends StatefulWidget {
  static String id = 'confirm-email';
  ConfirmEmail({Key key}) : super(key: key);

  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        child: Center(
            child: Text(
          'An email has just been sent to you, Click the link provided to complete registration',
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
