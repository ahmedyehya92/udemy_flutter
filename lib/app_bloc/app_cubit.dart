import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/app_bloc/app_states.dart';

import '../shared/components/conestants.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  ThemeAppMode themMode = ThemeAppMode.light;

  changeThemeMode({required ThemeAppMode themeAppMode}) {
    themMode = themeAppMode;
    if(themeAppMode == ThemeAppMode.light)
      emit(ThemeLightModeState());
    else
      emit(ThemeDarkModeState());
  }
}
