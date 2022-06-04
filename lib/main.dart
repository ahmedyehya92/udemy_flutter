import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/app_bloc/app_cubit.dart';
import 'package:udemy_flutter/app_bloc/app_states.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';

import 'layout/news/cubit/news_cubit.dart';
import 'modules/shop_modules/on_boarding/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';

void main() {
  // run widget
  BlocOverrides.runZoned(
    () {
      // Use cubits...
      WidgetsFlutterBinding.ensureInitialized();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // manager and builder design
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ThemeMode? themeMode =
                AppCubit.get(context).themMode == ThemeAppMode.light
                    ? ThemeMode.light
                    : ThemeMode.dark;
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeMode,
                theme: theme,
                darkTheme: darkTheme,
                home: Directionality(
                  textDirection: TextDirection.ltr,
                  child: OnBoardingScreen(),
                ));
          }),
    );
  }
}
