// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// * Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color.fromRGBO(255, 211, 105, 1),
  scaffoldBackgroundColor: const Color.fromRGBO(34, 40, 49, 1),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromRGBO(255, 211, 105, 1),
    foregroundColor: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 209, 209, 209)),
    hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 209, 209, 209)),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 0.2, color: Color.fromARGB(255, 0, 0, 0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashRadius: 0,
    side: const BorderSide(color: Colors.grey, width: 1),
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(const Color.fromRGBO(255, 211, 105, 1)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 211, 105, 1)),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white54,
    labelPadding: EdgeInsets.zero,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 255, 211, 105)),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headline1: const TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: const TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
    headline4: const TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    headline6: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    button: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
);

// * Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 0, 119, 125),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black54),
    titleTextStyle: TextStyle(color: Colors.black54),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 209, 209, 209)),
    hintStyle: TextStyle(fontSize: 14, color: Color.fromARGB(255, 209, 209, 209)),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 0.2, color: Color.fromARGB(255, 0, 0, 0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    splashRadius: 0,
    side: const BorderSide(color: Colors.grey, width: 1),
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(const Color.fromRGBO(3, 37, 39, 1)),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.black),
      backgroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.black,
    unselectedLabelColor: Colors.black54,
    labelPadding: EdgeInsets.zero,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 0, 119, 125)),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromARGB(255, 73, 73, 73)),
);
