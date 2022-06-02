import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/app_bloc/app_cubit.dart';
import 'package:udemy_flutter/app_bloc/app_states.dart';
import 'package:udemy_flutter/layout/news/news_layout.dart';
import 'package:udemy_flutter/layout/todo/todo_layout.dart';
import 'package:udemy_flutter/modules/users/UserScreen.dart';
import 'package:udemy_flutter/modules/bmi_result/bmi_result_screen.dart';
import 'package:udemy_flutter/modules/counter/counter_screen.dart';
import 'package:udemy_flutter/modules/home/home_screen.dart';
import 'package:udemy_flutter/modules/messanger/messanger_screen.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

import 'modules/bmi/bmi_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/messanger/messanger_screen_list_view.dart';
import 'shared/bloc_observer.dart';

void main() {
  // run widget
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  // manager and builder design
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  themeMode: AppCubit.get(context).themMode == ThemeAppMode.light ? ThemeMode.light : ThemeMode.dark,
                  theme: ThemeData(
                      scaffoldBackgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                          systemOverlayStyle: SystemUiOverlayStyle(
                              //statusBarColor: Color(0xff5549ad),
                              //statusBarBrightness: Brightness.light,
                              //statusBarIconBrightness: Brightness.light,
                              ),
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                          actionsIconTheme: IconThemeData(color: Colors.black)),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor: mainColor,
                          unselectedItemColor: Colors.grey,
                          backgroundColor: Colors.white,
                          elevation: 20.0),
                      textTheme: const TextTheme(
                          bodyText1: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black))),
                  darkTheme: ThemeData(
                      scaffoldBackgroundColor: const Color(0xff5549ad),
                      appBarTheme: AppBarTheme(
                          systemOverlayStyle: const SystemUiOverlayStyle(
                              //statusBarColor: Color(0xff5549ad),
                              //statusBarBrightness: Brightness.light,
                              //statusBarIconBrightness: Brightness.light,
                              ),
                          backgroundColor: mainColor,
                          elevation: 0.0,
                          titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor: Colors.white,
                          unselectedItemColor: Colors.grey,
                          backgroundColor: mainColor,
                          elevation: 20.0),
                      textTheme: const TextTheme(
                          bodyText1: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black))),
                  home: const Directionality(
                    textDirection: TextDirection.ltr,
                    child: NewsLayout(),
                  ));
            }));
  }
}
