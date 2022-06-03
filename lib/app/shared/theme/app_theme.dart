import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.black,
    accentColor: Colors.black,
    indicatorColor: Colors.black,
    buttonColor: Colors.black,

    // Define the default font family.
    fontFamily: 'Hind',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(fontSize: 25.0, color: Colors.black54),
      headline3: TextStyle(fontSize: 20.0, color: Colors.black54),
      headline4: TextStyle(fontSize: 18.0, color: Colors.black54),
      headline5: TextStyle(fontSize: 15.0, color: Colors.black54),
      bodyText1:
          TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
      bodyText2:
          TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Colors.black,
    )));
