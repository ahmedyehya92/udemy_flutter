import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';

class CacheHelper {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  void setThemeMode({required ThemeAppMode themeMode}) {
    themeMode == ThemeAppMode.light
        ? sharedPreferences.then(
            (value) => {value.setInt('Theme_Mode', ThemeAppMode.light.value)})
        : sharedPreferences.then(
            (value) => {value.setInt('Theme_Mode', ThemeAppMode.dark.value)});
  }

  Future<ThemeAppMode> getThemeMode() async {
    return await sharedPreferences.then((value) =>
        value.getInt('Theme_Mode') == ThemeAppMode.light.value
            ? ThemeAppMode.light
            : ThemeAppMode.dark);
  }

  Future<bool?>? saveData({
    required String key,
    required dynamic value,
  }) async {
    switch (value.runtimeType) {
      case String:
        return await sharedPreferences.then(
            (sharedPreferences) => sharedPreferences.setString(key, value));
      case int:
        return await sharedPreferences
            .then((sharedPreferences) => sharedPreferences.setInt(key, value));
      case bool:
        return await sharedPreferences
            .then((sharedPreferences)  {
              print('setBool - $key == $value');
              return sharedPreferences.setBool(key, value);
            });
      case double:
        return await sharedPreferences.then(
            (sharedPreferences) => sharedPreferences.setDouble(key, value));
    }
    return null;
  }

  Future<bool?>? getBool({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getBool(key));
  }
  Future<int?>? getInt({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getInt(key));
  }
  Future<double?>? getDouble({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getDouble(key));
  }
  Future<String?>? getString({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getString(key));
  }
}