import 'dart:ui';

import 'package:flutter/material.dart';

const Color mainColor = Color(0xff5549ad);
MaterialColor mainMaterialColor = MaterialColor(0xff5549ad, color);

enum ThemeAppMode {
  light(0),
  dark(1);

  final int value;

  const ThemeAppMode(this.value);
}


Map<int, Color> color = {
  50: Color.fromRGBO(85, 73, 173, .9),
  100: Color.fromRGBO(85, 73, 173, .9),
  200: Color.fromRGBO(85, 73, 173, .9),
  300: Color.fromRGBO(85, 73, 173, .9),
  400: Color.fromRGBO(85, 73, 173, .9),
  500: Color.fromRGBO(85, 73, 173, .9),
  600: Color.fromRGBO(85, 73, 173, .9),
  700: Color.fromRGBO(85, 73, 173, .9),
  800: Color.fromRGBO(85, 73, 173, .9),
  900: Color.fromRGBO(85, 73, 173, 1),
};

const THEME_MODE_SHARED_PREF_KEY = 'THEME_MODE_SHARED_PREF_KEY';
const IS_LOGGED_IN_SHARED_PREF_KEY = 'IS_LOGGED_IN_SHARED_PREF_KEY';
const TOKEN_SHARED_PREF_KEY = 'TOKEN_SHARED_PREF_KEY';
