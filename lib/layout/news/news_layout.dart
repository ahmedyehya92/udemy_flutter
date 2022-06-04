import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/app_bloc/app_cubit.dart';
import 'package:udemy_flutter/app_bloc/app_states.dart';
import 'package:udemy_flutter/layout/news/cubit/news_cubit.dart';
import 'package:udemy_flutter/layout/news/cubit/news_states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/conestants.dart';

import '../../modules/news_modules/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(NewsCubit.get(context).subScreensTitlesList[
                NewsCubit.get(context).currentBottomNavIndex]),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
              iconButtonConsumer()
            ],
          ),
          body: NewsCubit.get(context)
              .subScreensList[NewsCubit.get(context).currentBottomNavIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: NewsCubit.get(context).currentBottomNavIndex,
            onTap: (index) {
              NewsCubit.get(context).changeNavBarCurrentScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Since'),
            ],
          ),
        );
      },
    );
  }
}

iconButtonConsumer(){
  return BlocConsumer<AppCubit, AppStates> (
      listener: (context, state) {

  },
  builder: (context, state){
        return IconButton(
          icon: const Icon(Icons.brightness_4_outlined),
          onPressed: (){
            if(AppCubit.get(context).themMode == ThemeAppMode.light)
              AppCubit.get(context).changeThemeMode(themeAppMode: ThemeAppMode.dark);
            else
              AppCubit.get(context).changeThemeMode(themeAppMode: ThemeAppMode.light);

          },
        );
  }
  );
}
