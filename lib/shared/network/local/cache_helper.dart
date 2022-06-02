import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';

class CacheHelper {
  final Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  void setThemeMode(
  {
  required ThemeAppMode themeMode
  }
      )
  {
    if(themeMode == ThemeMode.light)
    sharedPreferences.then((value) => {value.setInt('Theme_Mode', ThemeAppMode.light.value)})
  }
}