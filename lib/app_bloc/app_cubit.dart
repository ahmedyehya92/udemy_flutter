import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/app_bloc/app_states.dart';

import '../shared/components/conestants.dart';
import '../shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState()) {
    cashHelper.getThemeMode().then((value) {
      themMode = value;
    });
  }

  static AppCubit get(context) => BlocProvider.of(context);
  CacheHelper cashHelper = CacheHelper();
  ThemeAppMode? themMode;

  Future<ThemeAppMode> getThemeMode() async {
    return await cashHelper.getThemeMode();
  }

  changeThemeMode({required ThemeAppMode themeAppMode}) {
    if (themeAppMode == ThemeAppMode.light)
      emit(ThemeLightModeState());
    else
      emit(ThemeDarkModeState());
    cashHelper.setThemeMode(themeMode: themeAppMode);
    themMode = themeAppMode;
  }
}
