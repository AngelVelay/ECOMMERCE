import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Color(0XFF222222),
    indicatorColor: Color(0XFF222222),
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromRGBO(0, 0, 0, 1)),
    scaffoldBackgroundColor: const Color(0xff2222222),

    // Define the default font family.
    fontFamily: 'Hind',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
      headline2: TextStyle(
          fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 20.0, color: Colors.white),
      headline4: TextStyle(fontSize: 18.0, color: Colors.white),
      headline5: TextStyle(fontSize: 15.0, color: Colors.white),
      headline6: TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      bodyText1:
          TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
      bodyText2:
          TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
      subtitle1: TextStyle(
          fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Color(0XFF222222),
    )));
