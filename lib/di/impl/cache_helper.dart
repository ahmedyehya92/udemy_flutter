import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_flutter/di/data/cache_helper_interface.dart';

@Injectable(as: CacheHelperInterface)
class CacheHelper implements CacheHelperInterface{
  final Future<SharedPreferences> sharedPreferences;

  CacheHelper(this.sharedPreferences);
  @override
  Future<bool?>? saveData({required String key, required value}) async {
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
  
  @override
  Future<bool?>? getBool({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getBool(key));
  }

  @override
  Future<double?>? getDouble({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getDouble(key));
  }

  @override
  Future<int?>? getInt({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getInt(key));
  }

  @override
  Future<String?>? getString({required String key}) async {
    return await sharedPreferences
        .then((mSharedPreferences) => mSharedPreferences.getString(key));
  }

}