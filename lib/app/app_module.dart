import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy_flutter/di/impl/cache_helper.dart';


@module
abstract class AppModule {
  @injectable
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @injectable
  CacheHelper get cacheHelper => CacheHelper(sharedPreferences);
}