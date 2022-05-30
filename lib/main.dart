import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          DioHelper().getTopBusinessNews();
    },
    blocObserver: MyBlocObserver(),
  );
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // manager and builder design
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          titleTextStyle: TextStyle(
            color: Colors.black
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: mainColor
        ),

      ),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff5549ad),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              //statusBarColor: Color(0xff5549ad),
              //statusBarBrightness: Brightness.light,
              //statusBarIconBrightness: Brightness.light,
            ),
            backgroundColor: Color(0xff5549ad),
            elevation: 0.0,
          ),
          bottomNavigationBarTheme:  BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: mainColor
          )
      ),
      home: const NewsLayout()
    );
  }

}