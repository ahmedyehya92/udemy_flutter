import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/conestants.dart';

ThemeData theme = ThemeData(
    primarySwatch: mainMaterialColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            //statusBarColor: Color(0xff5549ad),
            //statusBarBrightness: Brightness.light,
            //statusBarIconBrightness: Brightness.light,
            ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        actionsIconTheme: IconThemeData(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 20.0),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
    fontFamily: 'cairo');

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff5549ad),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          //statusBarColor: Color(0xff5549ad),
          //statusBarBrightness: Brightness.light,
          //statusBarIconBrightness: Brightness.light,
          ),
      backgroundColor: mainColor,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: mainColor,
        elevation: 20.0),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
    fontFamily: 'cairo');
