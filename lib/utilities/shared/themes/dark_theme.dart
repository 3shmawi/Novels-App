import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../colors/default_app_color.dart';

ThemeData darkTheme = ThemeData(
  iconTheme: const IconThemeData(color: Colors.white),
  hintColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    iconColor: defaultColor,
    labelStyle: TextStyle(color: defaultColor),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.white,
      ),
    ),
  ),
  cardTheme: CardTheme(
    color: HexColor('333739'),
  ),
  textTheme: const TextTheme(
    // ignore: prefer_const_constructors
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
    ),
    caption: TextStyle(
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  dividerColor: Colors.white,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
    selectedItemColor: defaultColor,
  ),
);
