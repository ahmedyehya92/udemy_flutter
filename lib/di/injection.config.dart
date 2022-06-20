// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async' as _i5;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../app/app_module.dart' as _i7;
import 'data/cache_helper_interface.dart' as _i4;
import 'impl/cache_helper.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.CacheHelper>(() => appModule.cacheHelper);
  gh.factory<_i4.CacheHelperInterface>(
      () => _i3.CacheHelper(get<_i5.Future<_i6.SharedPreferences>>()));
  gh.factoryAsync<_i6.SharedPreferences>(() => appModule.sharedPreferences);
  return get;
}

class _$AppModule extends _i7.AppModule {}
