import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Popins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // textTheme:
  );


  static ThemeData darkTheme = ThemeData.dark();
}