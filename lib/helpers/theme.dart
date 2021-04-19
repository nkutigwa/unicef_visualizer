import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
//import 'package:flutter_login_screen/constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: kBackgroundLightColor,
      elevation: 0,
      textTheme: GoogleFonts.workSansTextTheme(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
//        color: kBottomNavBarItemColor,
        color: kPrimaryColor,
      ),
      selectedItemColor: kPrimaryColor,
      selectedLabelStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
//          selectedFontSize: 12.0,
      elevation: 3.0,
      unselectedItemColor: Colors.black45,
      showUnselectedLabels: true,
    ),
    primaryColor: kPrimaryColor,
    buttonColor: kPrimaryColor,
    primaryColorLight: kBackgroundDarkColor,
    accentColor: kPrimaryDarkColor,
    errorColor: kErrorLightColor,
    hintColor: kSecondaryLightColor,
    cardColor: kCardLightColor,
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
    unselectedWidgetColor: kSecondaryLightColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColour,
    backgroundColor: kBackgroundLightColor,
    iconTheme: IconThemeData(color: kBackgroundDarkColor),
    primaryIconTheme: IconThemeData(color: kBackgroundDarkColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: kPrimaryColor,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      hintStyle: GoogleFonts.workSans(
        color: kSecondaryLightColor,
        fontSize: 12.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kSecondaryLightColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorLightColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorLightColor,
        ),
      ),
      errorStyle: GoogleFonts.workSans(
        color: kErrorDarkColor,
        fontSize: 12.0,
      ),
    ),
    textTheme: GoogleFonts.workSansTextTheme().copyWith(
      headline1: GoogleFonts.merriweather(
        color: kPrimaryLightColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.workSans(
        color: kPrimaryLightColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.workSans(
        color: kPrimaryLightColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.workSans(
        color: kPrimaryLightColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.workSans(
        color: kPrimaryLightColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: GoogleFonts.workSans(
        color: kPrimaryLightColor,
        fontSize: 16.0,
      ),
      bodyText2: GoogleFonts.workSans(
        color: kPrimaryLightColor,
        fontSize: 14.0,
      ),
      subtitle1: GoogleFonts.workSans(
        color: kSecondaryLightColor,
        fontSize: 14.0,
      ),
      subtitle2: GoogleFonts.workSans(
        color: kSecondaryLightColor,
        fontSize: 12.0,
      ),
      button: GoogleFonts.roboto(
        color: kPrimaryDarkColor,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

// Dark Theme
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blueAccent,
      selectedIconTheme: IconThemeData(
        color: Colors.cyan,
      ),
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
//      selectedFontSize: 12.0,
      elevation: 3.0,
      unselectedItemColor: Colors.black45,
    ),
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryLightColor,
    buttonColor: kPrimaryColor,
    primaryColorLight: kBackgroundLightColor,
    hintColor: kSecondaryDarkColor,
    cardColor: kCardDarkColor,
    errorColor: kErrorDarkColor,
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
    brightness: Brightness.dark,
    indicatorColor: kPrimaryColor,
    unselectedWidgetColor: kSecondaryDarkColor,
    scaffoldBackgroundColor: kBackgroundDarkColor,
    appBarTheme: AppBarTheme(color: kBackgroundDarkColor, elevation: 0.0),
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kPrimaryColor),
    primaryIconTheme: IconThemeData(color: kPrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      hintStyle: GoogleFonts.workSans(
        color: kSecondaryDarkColor,
        fontSize: 12.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kSecondaryDarkColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorDarkColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: kErrorDarkColor,
        ),
      ),
      errorMaxLines: 1,
      helperStyle: GoogleFonts.workSans(
        color: kSecondaryDarkColor,
        fontSize: 10.0,
      ),
      errorStyle: GoogleFonts.workSans(
        color: kErrorDarkColor,
        fontSize: 10.0,
      ),
    ),
    textTheme: GoogleFonts.workSansTextTheme().copyWith(
      headline1: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 16.0,
      ),
      bodyText2: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 14.0,
      ),
      subtitle1: GoogleFonts.workSans(
        color: kSecondaryDarkColor,
        fontSize: 14.0,
      ),
      subtitle2: GoogleFonts.workSans(
        color: kSecondaryDarkColor,
        fontSize: 12.0,
      ),
      button: GoogleFonts.workSans(
        color: kPrimaryDarkColor,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
