import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/app_bloc/app_cubit.dart';
import 'package:udemy_flutter/app_bloc/app_states.dart';
import 'package:udemy_flutter/layout/shop_app/shop_layout.dart';
import 'package:udemy_flutter/modules/begginer_modules/messanger/messanger_screen.dart';
import 'package:udemy_flutter/modules/shop_modules/login/login_screen.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';
import 'di/injection.dart';
import 'layout/news/cubit/news_cubit.dart';
import 'layout/shop_app/cubit.dart';
import 'modules/begginer_modules/messanger/messanger_screen_list_view.dart';
import 'modules/shop_modules/on_boarding/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';

void main() async {
  // run widget
  BlocOverrides.runZoned(
    () async {
      // Use cubits...
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
      CacheHelper cacheHelper = CacheHelper();
      cacheHelper.getBool(key: 'onBoardingOpened')?.then((value) {
        if (kDebugMode) {print('get onBoardingOpened => $value');}
        if (value == null || value == false)
          runApp(MyApp(OnBoardingScreen(cacheHelper)));

        else {
          cacheHelper.getData(keys: [IS_LOGGED_IN_SHARED_PREF_KEY, TOKEN_SHARED_PREF_KEY])?.then((value) {
            if ((value?[IS_LOGGED_IN_SHARED_PREF_KEY] as bool?) != false && ((value?[TOKEN_SHARED_PREF_KEY]) as String?)?.isNotEmpty == true)
              runApp(MyApp(ShopLayout()));
            else
              runApp(MyApp(ShopLoginScreen(cacheHelper)));
          });

          cacheHelper.getBool(key: IS_LOGGED_IN_SHARED_PREF_KEY)?.then((value) {
            if(value == true)
              runApp(MyApp(ShopLayout()));
            else
              runApp(MyApp(ShopLoginScreen(cacheHelper)));
          });

        }
      });

    },
    blocObserver: MyBlocObserver(),
  );
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  final Widget firstScreen;

  MyApp(this.firstScreen, {Key? key}) : super(key: key);

  // manager and builder design
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getThemeMode(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit(),
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
                : AppCubit.get(context).themMode == ThemeAppMode.dark
                ? ThemeMode.dark
                : ThemeMode.light;
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeMode,
                theme: theme,
                darkTheme: darkTheme,
                home: Directionality(
                  textDirection: TextDirection.rtl,
                  child: MessangerScreenListView(),
                ));
          }),
    );
  }
}
