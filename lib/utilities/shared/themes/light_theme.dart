import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novels/utilities/components/system_ui_overlay.dart';

import '../colors/default_app_color.dart';

ThemeData lightTheme = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  appBarTheme:  AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: style,
  ),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: defaultColor,
  ),
);
