//import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_screen/model/user.dart';
//import 'package:flutter_login_screen/services/authenticate.dart';
//import 'package:flutter_login_screen/services/helper.dart';
//import 'package:flutter_login_screen/ui/auth/authScreen.dart';
import 'package:flutter_login_screen/ui/home/dashboardScreen.dart';
import 'package:flutter_login_screen/ui/home/profileScreen.dart';
//import 'package:flutter_login_screen/ui/login/confirmEmail.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  State createState() {
    return _HomeState(user);
  }
}

class _HomeState extends State<HomeScreen> {
  final User user;

  _HomeState(this.user);

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//  static List<Widget> _widgetOptions = <Widget>[
//    Text(
//      'Index 0: Dashboard',
//      style: optionStyle,
//    ),
//    Text(
//      'Index 1: Datatables',
//      style: optionStyle,
//    ),
//
//    Text(
//      'Index 2: Profile',
//      style: optionStyle,
//    ),
//  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      DashboardScreen(),
//      Text(
//        'Index 0: Dashboard',
//        style: optionStyle,
//      ),
      Text(
        'Index 1: Datatables',
        style: optionStyle,
      ),
      PersonalInfoStream(),
//      ProfileScreen(
////        user: user,
//      ),
//      Text(
//        'Index 2: Profile',
//        style: optionStyle,
//      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        selectedIconTheme:
            Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
        onTap: _onItemTapped,
      ),
    );
  }
}
