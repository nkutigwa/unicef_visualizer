import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
////import 'package:flutter_login_screen/constants.dart';
//import 'package:flutter_login_screen/main.dart';
//import 'package:flutter_login_screen/model/user.dart';
//import 'package:flutter_login_screen/services/authenticate.dart';
//import 'package:flutter_login_screen/services/helper.dart';
//import 'package:flutter_login_screen/ui/auth/authScreen.dart';
//import 'package:flutter_login_screen/ui/login/confirmEmail.dart';
//import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

//class ProfileScreen extends StatefulWidget {
//  final User user;
//
//  ProfileScreen({this.user});
//
//  @override
//  State createState() {
//    return _ProfileScreenState(user);
//  }
//}
//
//class _ProfileScreenState extends State<ProfileScreen> {
//  final User user;
//
//  _ProfileScreenState(this.user);
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Container(
//        child: SingleChildScrollView(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              displayCircleImage(user.profilePictureURL, 125, false),
////              AgeGroupCard(),
////              BmiStatusCard(),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(user.firstName),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(user.email),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(user.phoneNumber),
//              ),
//              GestureDetector(
//                onTap: () {
//                  push(context, ConfirmEmail());
//                },
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(user.userID),
//                ),
//              ),
//              ListTile(
//                title: Text(
//                  'Logout',
//                  style: TextStyle(color: Colors.black),
//                ),
//                leading: Transform.rotate(
//                    angle: pi / 1,
//                    child: Icon(Icons.exit_to_app, color: Colors.black)),
//                onTap: () async {
//                  user.active = false;
//                  user.lastOnlineTimestamp = Timestamp.now();
//                  FireStoreUtils.updateCurrentUser(user);
//                  await auth.FirebaseAuth.instance.signOut();
//                  MyAppState.currentUser = null;
//                  pushAndRemoveUntil(context, AuthScreen(), false);
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

final _firestore = FirebaseFirestore.instance;
final userEmail = FirebaseAuth.instance.currentUser.email;
//TODO Refactor Code Later

class PersonalInfoStream extends StatefulWidget {
  @override
  _PersonalInfoStreamState createState() => _PersonalInfoStreamState();
}

class _PersonalInfoStreamState extends State<PersonalInfoStream> {
  Future<void> updateUser() {
    return _firestore
        .doc('ABC123')
        .update({'company': 'Stokes and Sons'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  DateTime selectedDate = DateTime.now();
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime(1960),
    end: DateTime(2023),
  );

  Future<void> _selectDate(BuildContext context) async {
    final pickedDates = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
      initialDateRange: dateTimeRange,
    );
    if (pickedDates != null && pickedDates != dateTimeRange)
      setState(() {
        dateTimeRange = pickedDates;
      });
  }

  @override
  Widget build(BuildContext context) {
    String firstName = '';
    String lastName = '';
    String phoneNumber = '';
    String email = '';
    String gender = '';
    String birthDate = '';
    String documentRef = '';
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('users')
          .where("email", isEqualTo: userEmail)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final users = snapshot.data.docs;
        List<Widget> personalInfoPages = [];
        for (var user in users) {
          documentRef = user.reference.id;
          firstName = user.data()['firstName'];
          email = user.data()['email'].toString();
          lastName = user.data()['lastName'].toString();
          phoneNumber = user.data()['phoneNumber'].toString();
          gender = user.data()['gender'].toString();
          birthDate = user.data()['birthDate'];

          final personalInfoPage = PersonalInformationPage(
            firstName: firstName,
            lastName: lastName ?? '',
            phoneNumber: phoneNumber ?? "",
            email: email ?? '',
            birthDate: birthDate ?? "Enter Date",
            gender: gender ?? "Select One",
            onChangedFirstName: (value) {
              firstName = value;
              print(firstName);
            },
            onChangedLastName: (value) {
              lastName = value;
            },
            onChangedEmail: (value) {
              email = value;
            },
            onChangedBirthDate: (value) {
              birthDate = value;
            },
            onChangedGender: (value) {
              gender = value;
            },
            onTapBirthDate: () {
              _selectDate(context);
            },
            onChangedPhoneNumber: (value) {
              phoneNumber = value;
            },
          );

          personalInfoPages.add(personalInfoPage);
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () async {
                print(userEmail);
                print(documentRef);
                print(FirebaseAuth.instance.currentUser.displayName);
//                updateUser();
                Navigator.pop(context);
              },
            ),
            actions: [
              FlatButton(
                color: Colors.white,
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                onPressed: () async {
                  //TODO Save to FireStore
                  print(userEmail);
                  print(documentRef);
//                updateUser();
                  _firestore
                      .collection('users')
                      .doc(documentRef)
                      .update({
                        'firstName': firstName,
                        'lastName': lastName,
                        'phoneNumber': phoneNumber,
                        'birthDate': birthDate ?? "",
                        'email': email,
                        'gender': gender ?? "",
                      })
                      .then((value) => print("User Updated"))
                      .catchError(
                          (error) => print("Failed to update user: $error"));
                  await FirebaseAuth.instance.currentUser.updateProfile(
                    displayName: firstName,
                  );
                  print(FirebaseAuth.instance.currentUser.displayName);
                  Navigator.pop(context);
                },
              )
            ],
          ),
          backgroundColor: CupertinoColors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: personalInfoPages,
            ),
          ),
        );
      },
    );
  }
}

class PersonalInformationPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String gender;
  final String birthDate;
  final String phoneNumber;
  final String email;
  final Function onChangedFirstName;
  final Function onChangedLastName;
  final Function onChangedGender;
  final Function onChangedBirthDate;
  final Function onChangedPhoneNumber;
  final Function onChangedEmail;
  final Function onTapBirthDate;

  PersonalInformationPage(
      {Key key,
      this.firstName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.phoneNumber,
      this.email,
      this.onChangedFirstName,
      this.onChangedLastName,
      this.onChangedGender,
      this.onChangedBirthDate,
      this.onChangedPhoneNumber,
      this.onChangedEmail,
      this.onTapBirthDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
            child: Text(
              'Edit personal info',
//                style: kHeadingTextStyle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          FirebaseAuth.instance.currentUser.photoURL != null
              ? CachedNetworkImage(
                  imageUrl: FirebaseAuth.instance.currentUser.photoURL,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PersonalInfoWidget(
              label: 'First Name',
              hintText: firstName == null ? 'first Name' : firstName,
              onChanged: onChangedFirstName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PersonalInfoWidget(
              label: 'Last Name',
              hintText: lastName,
              onChanged: onChangedLastName,
            ),
          ),
//          GenderWidget(
//            initialGenderValue: gender ?? 'Select One',
//            onChanged: onChangedGender,
//          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PersonalInfoWidget(
              label: 'Birth Date',
              hintText: birthDate,
              onChanged: onChangedBirthDate,
              onTapLabel:
//    () {
                  onTapBirthDate,
////                buildDatePicker(context);
//              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PersonalInfoWidget(
              label: 'Email',
              hintText: email,
              onChanged: onChangedEmail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PersonalInfoWidget(
              label: 'Phone Number',
              hintText: phoneNumber,
              onChanged: onChangedEmail,
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInfoWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData leading;
  final Function onChanged;
  final Function onTap;
  final Function onTapLabel;
  final bool obscure;
  final TextInputType keyboard;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final FocusNode focusNode;

  PersonalInfoWidget(
      {Key key,
      this.hintText,
      this.leading,
      this.onChanged,
      this.obscure,
      this.keyboard,
      this.validator,
      this.controller,
      this.focusNode,
      this.label,
      this.onTap,
      this.onTapLabel});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onTapLabel,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          Container(
//            padding: EdgeInsets.all(8.0),
            child: TextFormField(
//              validator: validator,
//              controller: controller,
//              focusNode: focusNode,
              textInputAction: TextInputAction.done,
//              textAlign: TextAlign.left,
              onChanged: onChanged,
              onTap: onTap,
//              keyboardType: keyboard,
//              onTap: () {},
//              onFieldSubmitted: (value) {},
//              autofocus: false,
//              obscureText: obscure ? true : false,
              decoration: InputDecoration(
//                icon: Icon(
//                  leading,
//                  color: Colors.black45 /*Colors.deepPurple*/,
//                ),
                border: InputBorder.none,
                hintText: hintText,
//          hintStyle: TextStyle(
////            fontFamily: 'Poppins',
//              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GenderWidget extends StatefulWidget {
  final String initialGenderValue;
  final Function onChanged;
  GenderWidget({Key key, @required this.initialGenderValue, this.onChanged})
      : super(key: key);
  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  String genderValue = "Select One";

//  String dropdownFilter = 'Short by: Price';
  @override
  void initState() {
    // TODO: implement initState
    genderValue = widget.initialGenderValue ?? "Select One";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DropdownButton(
            value: genderValue,
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 20.0,
            ),
            underline: Container(),
            onChanged: (value) {
              setState(() {
                genderValue = value;
                widget.onChanged(value);
              });
            },
            items: [
              "Select One",
              "Male",
              "Female",
              "Rather not say",
            ]
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
