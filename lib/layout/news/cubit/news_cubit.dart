import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news/cubit/news_states.dart';
import 'package:udemy_flutter/modules/business_news/business_news_screen.dart';
import 'package:udemy_flutter/modules/settings/settings_screen.dart';
import 'package:udemy_flutter/modules/since_news/since_news_screen.dart';
import 'package:udemy_flutter/modules/sports/sports_news_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;
  var subScreensTitlesList = [
    'Business',
    'Sports',
    'Since',
    'Settings'
  ];
  var subScreensList = [
    const BusinessNewsScreen(),
    const SportsNewsScreen(),
    const SinceNewsScreen(),
    const SettingsScreen()
  ];

  void changeNavBarCurrentScreen(int index) {
    currentBottomNavIndex = index;
    emit(BottomNaveChangeState());
  }

}