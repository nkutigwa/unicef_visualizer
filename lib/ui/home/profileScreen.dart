import 'package:flutter/material.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
//import 'package:flutter_login_screen/constants.dart';
import 'package:flutter_login_screen/main.dart';
import 'package:flutter_login_screen/model/user.dart';
import 'package:flutter_login_screen/services/authenticate.dart';
import 'package:flutter_login_screen/services/helper.dart';
import 'package:flutter_login_screen/ui/auth/authScreen.dart';
import 'package:flutter_login_screen/ui/login/confirmEmail.dart';
import 'package:flutter_login_screen/ui/charts/ageGroupCard.dart';
import 'package:flutter_login_screen/ui/charts/bmiStatusCard.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  State createState() {
    return _ProfileScreenState(user);
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User user;

  _ProfileScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              displayCircleImage(user.profilePictureURL, 125, false),
//              AgeGroupCard(),
//              BmiStatusCard(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.firstName),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.phoneNumber),
              ),
              GestureDetector(
                onTap: () {
                  push(context, ConfirmEmail());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user.userID),
                ),
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Transform.rotate(
                    angle: pi / 1,
                    child: Icon(Icons.exit_to_app, color: Colors.black)),
                onTap: () async {
                  user.active = false;
                  user.lastOnlineTimestamp = Timestamp.now();
                  FireStoreUtils.updateCurrentUser(user);
                  await auth.FirebaseAuth.instance.signOut();
                  MyAppState.currentUser = null;
                  pushAndRemoveUntil(context, AuthScreen(), false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//    Container(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          displayCircleImage(user.profilePictureURL, 125, false),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Text(user.firstName),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Text(user.email),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Text(user.phoneNumber),
//          ),
//          GestureDetector(
//            onTap: () {
//              push(context, ConfirmEmail());
//            },
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text(user.userID),
//            ),
//          ),
//        ],
//      ),
//    ),
