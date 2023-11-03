import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appLightThemeData = ThemeData.light().copyWith();

  static final ThemeData appDarkThemeData = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.white30,
    scaffoldBackgroundColor: const Color(0xff424242),
    iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: Colors.white,
        ),
  );
}
