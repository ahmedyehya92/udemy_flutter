import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news/cubit/news_states.dart';

import '../../../modules/news_modules/business_news/business_news_screen.dart';
import '../../../modules/news_modules/since_news/since_news_screen.dart';
import '../../../modules/news_modules/sports/sports_news_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;
  var subScreensTitlesList = [
    'Business',
    'Sports',
    'Since',
  ];
  var subScreensList = [
    const BusinessNewsScreen(),
    const SportsNewsScreen(),
    const SinceNewsScreen(),
  ];

  List<dynamic> businessNews = [];
  List<dynamic> searchResultNews = [];

  void changeNavBarCurrentScreen(int index) {
    currentBottomNavIndex = index;
    emit(BottomNaveChangeState());
  }

  getBusinessNews() {
    emit(GetBusinessNewsLoadingState());
    DioHelper().getTopBusinessNews()?.then((value) {
      businessNews = value?.data['articles'];
      print(businessNews[0]['title']);
      emit(GetBusinessNewsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessNewsFailureState(error.toString()));
    });
  }

  searchNews(String q) {
    emit(SearchNewsLoadingState());
    DioHelper().searchNews(q)?.then((value) {
      searchResultNews = value?.data['articles'];
      emit(SearchNewsSuccessState());
    }).catchError((error) {
      emit(SearchNewsFailureState(error.toString()));
    });
  }
}
