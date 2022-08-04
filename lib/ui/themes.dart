import 'package:flutter/material.dart';

// ------------------------------------------------------------ LIGHT THEME  ------------------------------------------------------------
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  focusColor: Color(0xff087cf2),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.black),
    labelMedium: TextStyle(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedLabelStyle: TextStyle(color: Colors.white),
  ),
  shadowColor: Colors.blue.shade800,
);

// ------------------------------------------------------------ DARK THEME  ------------------------------------------------------------
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff131312),
  focusColor: Color(0xff087cf2).withAlpha(127),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff242428),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedLabelStyle: TextStyle(color: Colors.white),
  ),
  shadowColor: Colors.blue.shade800,
);
